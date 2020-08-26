%clc;
rng('default');
clear all;
addpath('other branch of project');
addpath('GA');
addpath('polar 2');
addpath('PolarCodesBeliefPropagationDecoder-master/polarBP_standard');
load Inf_reliables_N256_R05_crc9_5g.mat RR
RR_5G=RR;
%load Inf_reliables_64_pw.mat RR
load Inf_reliables_N256_R05_crc9_PW.mat RR
%load seq_CS.mat CS
RR_PW=RR;
%RR_SUB_64=[ones(1,7); [20 23 26 36 38 42 49]];
RR_SUB_256=[ones(1,17); [60 62 80 88 91 103 106 114 143 150 154 161 166 170 178 196 198]];
%RR_SUB_256_ORD=[ones(1,21); [164 107 166 150 93 155 115 60 225 201 170 62 80 209 91 88 198 178 144 196 104]];

%RR_PW=CS;
T_flips=50;
R_find_5g=RR_5G(2,1:min(length(RR_5G),T_flips));
R_find_pw=RR_PW(2,1:min(length(RR_PW),T_flips));
n=8;
M=2;
T=50;
N = 2^n;
R=1/2;
Mr = index_Matrix(N);
fe=40;
delta=32;
List_size=32;
 crc_poly='z^9 + z^8 + z^6 + z^5 + z^3 + z^2 + 1';
%crc_poly='z^11 + z^9 + z^8 + z^7 + z^2 + 1';
 poly_deg=9;
%crc_poly='z^6 + z + 1';
%poly_deg=6;
crcdetector = comm.CRCDetector(crc_poly);
crcgenerator = comm.CRCGenerator(crc_poly);
K=floor(N*R); %remove -9!!! 
%K=23;
EbNoArray=[1:0.2:4.8];
FER_SC=zeros(1,length(EbNoArray));
FER_SCF=zeros(1,length(EbNoArray));
FER_SCL=zeros(1,length(EbNoArray));
FER_FANO=zeros(1,length(EbNoArray));
FER_SCLAD=zeros(1,length(EbNoArray));
FER_SCFw2=zeros(1,length(EbNoArray));
FER_BP=zeros(1,length(EbNoArray));
FER_FSCL=zeros(1,length(EbNoArray));
FER_SCLflip=zeros(1,length(EbNoArray));
FER_SCLflip_simple_5g=zeros(1,length(EbNoArray));
FER_SCLflip_simple_pw=zeros(1,length(EbNoArray));
FER_SCLflip_original=zeros(1,length(EbNoArray));
FER_SCLf_simple=zeros(1,length(EbNoArray));
FER_SCL_SP=zeros(1,length(EbNoArray));
FER_chase=zeros(1,length(EbNoArray));
Lavg=zeros(1,length(EbNoArray));
%5G frozen channels
Fr = table2array(readtable('rank.csv'));
channels=Fr(:,2)';
channels=channels(channels<N);
frozen_indices = channels(1:N-K-poly_deg)+1;
frozen_bits_indicator=zeros(1,N);
frozen_bits_indicator(frozen_indices)=1;
f=frozen_bits_indicator;
f(frozen_bits_indicator==0)=1/2;
f(f==1)=0;
ID_all=[];
ID_correct=[];
ID_error=[];
ID_last=[];

CS=generateCS(find(f==1/2),n);
[~,R1,SPC,Rep] = subcodes_structure1(f);

%PW
% f=ones(1,N)/2;
% frozen_bits_indicator=zeros(1,N);
% W = de2bi(0:N-1) * 2.^((0:log2(N)-1)'/4);
% [~, Q] = sort(W);
% f(Q(1:N-K-poly_deg))=0;
% frozen_bits_indicator(Q(1:N-K-poly_deg))=1;

G=[];
I=eye(K+poly_deg);
for i=1:K+poly_deg
    c=zeros(1,N);
    c(~frozen_bits_indicator)=I(i,:);
    x= polar_encode(c,frozen_bits_indicator);
    G=[G; x];
end

for i=1:length(EbNoArray)
    EbNo=EbNoArray(i);
    noiseVar = 10.^(-EbNo/10);
    f_sc=0;
    f_scf=0;
    f_sclist=0;
    f_cslad=0;
    f_scfw2=0;
    f_sclf=0;
    f_sclflip=0;
    f_sclflip_simple_5g=0;
    f_sclflip_simple_pw=0;
    f_sclflip_original=0;
    f_sclf_simple=0;
    f_scl_sp=0;
    f_chase=0;
    
    Li=0;
    f_csfano=0;
    f_bp=0;
%    f_isd=0;
    Itr=0;
    while min([f_sclist, f_sclflip_simple_5g,f_sclflip_simple_pw])<fe %f_sclflip
    %while f_chase<fe
        Itr=Itr+1;
        u = randi([0, 1], 1, K);
        u_inner=crcgenerator(u')';
        c1=mod(u_inner*G,2);
        u1 = polar_transform_mat(c1);
%        [x,u1] = polar_encode_crc(u,crc_poly,frozen_bits_indicator); %encode with CRC
        
        txSig = qammod(c1,M,'InputType','bit','UnitAveragePower',true);
%        txSig = qammod(x,M,'InputType','bit','UnitAveragePower',true);
        rxSig = awgn(txSig,EbNo,'measured');
        rxDataSoft = qamdemod(rxSig,M,'OutputType','approxllr', ...
                    'UnitAveragePower',true,'NoiseVariance',noiseVar);
        %[decoded_bits1,~,llr_out] = polar_decode(rxDataSoft, frozen_bits_indicator,[],N+1);
        %decoded_bits2 = polar_decode_flip(rxDataSoft, frozen_bits_indicator,T,crc_poly);
        decoded_bits3=polar_decode_list(rxDataSoft,f,List_size);
        cands=[];
        for l=1:List_size
            uu=decoded_bits3(l,1:end);
            [~,err]=crcdetector(uu(~frozen_bits_indicator)');
            if err == 0
                cands=[cands; uu];
            end
        end
        if isempty(cands)
           decoded_bits3=decoded_bits3(1,:);
        else
           decoded_bits3=cands(1,:);
        end
        
        decoded_bits7=polar_decode_list_fast(rxDataSoft,f,List_size);
        cands=[];
        for l=1:List_size
            uu=decoded_bits7(l,1:end);
            [~,err]=crcdetector(uu(~frozen_bits_indicator)');
            if err == 0
                cands=[cands; uu];
            end
        end
        if isempty(cands)
           decoded_bits7=decoded_bits7(1,:);
        else
           decoded_bits7=cands(1,1:end);
        end
% 
%         [decoded_bits4, Lact] = adaptive_SCL_decode(rxDataSoft,f,List_size,crc_poly);
%         Li=Li+Lact;
        %decoded_bits5 = polar_decode_flip_w2(rxDataSoft, frozen_bits_indicator,20,5,5,0.3,crc_poly);
        %decoded_bits6 = BP_Decoder_LLR((~frozen_bits_indicator)', frozen_bits_indicator', rxDataSoft, 50, Mr);
        [decoded_bits8, indexes,idx_last] = SCLflip(rxDataSoft,f,8,T_flips,0.375,crc_poly,[]);
        [decoded_bits10] = SCLflip(rxDataSoft,f,8,T_flips,0.375,crc_poly,RR_5G); %5G
        [decoded_bits9] = SCLflip_new(rxDataSoft,f,8,T_flips,crc_poly,RR_5G); %PW
        [decoded_bits11] = SCLflip_subcodes(rxDataSoft,f,8,T_flips,0,crc_poly,RR_SUB_256,R1,SPC,Rep); %
%        [decoded_bits12] = SCL_SP(rxDataSoft,f,8,crc_poly,CS); %CS
        [decoded_bits13] = SCLflip_subcodes(rxDataSoft,f,8,T_flips,10,crc_poly,RR_SUB_256,R1,SPC,Rep); %5G
        %decoded_bits13 = polar_decode_chase(rxDataSoft, f,4,crc_poly,Mr);
        %[decoded_bits11] = SCLflip(rxDataSoft,f,8,T_flips,0.375,crc_poly,[]);
        ID_all=[ID_all indexes];
        %decoded_bits9 = ISD_SCdec(rxDataSoft,frozen_bits_indicator,0.35,crc_poly,G);
%         if ~isequal(decoded_bits1, u1)
%             f_sc=f_sc+1;
%         end
%         if ~isequal(decoded_bits2, u1)
%             f_scf=f_scf+1;
%         end
        if ~isequal(decoded_bits3, u1)
            f_sclist=f_sclist+1;
        end
        
        if ~isequal(decoded_bits13, u1)
            f_chase=f_chase+1;
        end 
%          if ~isequal(decoded_bits4,u1)
%              f_cslad=f_cslad+1;
%          end
%          if ~isequal(decoded_bits5, u1)
%             f_scfw2=f_scfw2+1;
%          end
% %          if ~isequal(decoded_bits6', u1(frozen_bits_indicator==0))
% %             f_bp=f_bp+1;
% %          end
        if ~isequal(decoded_bits7, u1)
            f_sclf=f_sclf+1;
        end
        if ~isequal(decoded_bits10, u1)
            f_sclflip_simple_5g=f_sclflip_simple_5g+1;
        end
         if ~isequal(decoded_bits8, u1)
             f_sclflip_original=f_sclflip_original+1;
         else
             ID_correct=[ID_correct indexes];
             if ~isempty(indexes)
                ID_last=[ID_last idx_last];
             end
         end
         if ~isequal(decoded_bits9, u1)
             f_sclflip_simple_pw=f_sclflip_simple_pw+1;
         end
         
         if ~isequal(decoded_bits11, u1)
             f_sclf_simple=f_sclf_simple+1;
         end 
         
%          if ~isequal(decoded_bits12, u1)
%              f_scl_sp=f_scl_sp+1;
%          end 
    end
%     FER_SC(i)=f_sc/Itr;
%     FER_SCF(i)=f_scf/Itr;
    FER_SCL(i)=f_sclist/Itr;
%     FER_SCLAD(i)=f_cslad/Itr;
%     FER_SCFw2(i)=f_scfw2/Itr;
     FER_FSCL(i)=f_sclf/Itr;
     FER_SCLflip_simple_5g(i)=f_sclflip_simple_5g/Itr;
     FER_SCLflip_simple_pw(i)=f_sclflip_simple_pw/Itr;
     FER_SCLflip_original(i)=f_sclflip_original/Itr;
     FER_SCLf_simple(i)=f_sclf_simple/Itr;
%     FER_SCL_SP(i)=f_scl_sp/Itr;
     FER_chase(i)=f_chase/Itr;
%    FER_ISD(i)=f_isd/Itr;
%    Lavg(i)=Li/Itr;
    disp([ '  FER SCL: ' num2str(FER_SCL(i)) ...
           ', and FER FastSCL: ' num2str(FER_FSCL(i)) ...
           ', and FER SCLflip simple 5g seq: ' num2str(FER_SCLflip_simple_5g(i)) ...
           ', and FER SCLflip simple with part dec: ' num2str(FER_SCLflip_simple_pw(i)) ...
           ', and FER SCLflip original: ' num2str(FER_SCLflip_original(i)) ...
           ', and FER SCLflip simple subcodes: ' num2str(FER_SCLf_simple(i)) ...
           ', and FER SCLflip subcodes reduced: ' num2str(FER_chase(i)) ...         
           ', at SNR = ' num2str(EbNo) ' dB'])
      %           
          %            ', and FER Chase: ' num2str(FER_chase(i)) ...
          %            ', and FER SCL Shifted Pruning: ' num2str(FER_SCL_SP(i)) ...  
          % 
          %            ', and Block Error Rate ISD: ' num2str(FER_ISD(i)) ...
          %'Block Error Rate SC: ' num2str(FER_SC(i)) ...
          % ', and Block Error Rate SCF: ' num2str(FER_SCF(i)) ...
          %', and Block Error Rate SCFw2: ' num2str(FER_SCFw2(i)) ...
          %', and Block Error Rate SCL_ad: ' num2str(FER_SCLAD(i)) ...
          %', with average list size: ' num2str(Lavg(i)) ...
          % ', and Block Error Rate FastSCL: ' num2str(FER_FSCL(i)) ...
end
 

