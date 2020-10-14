#pragma once

#include <vector>
#include <tuple>

// for (256, 128) code!!!!
class FlipStatistic1 {
private:
	static const std::vector<int> _singles;
	static const std::vector<std::tuple<int, int>> _pairs;

public:
	static std::vector<int> GetSingles() {
		return _singles;
	}

	static std::vector<std::tuple<int, int>> GetPairs() {
		return _pairs;
	}

};

const std::vector<int> FlipStatistic1::_singles = { //156, 61, 62, 79, 154, 224, 166, 208, 169, 170,
													};// 165, 153, 114, 116, 172, 120, 87, 113, 150, 177, 195, 108, 178, 198, 197, 180, 91, 209, 184, 201, 106, 93, 202, 155, 94, 210, 143, 151, 225, 204, 107, 212, 115, 226, 103, 109, 167, 157, 110, 216, 228, 158, 117, 232, 118, 240, 171, 121, 199, 122, 179, 203, 124 };

const std::vector<std::tuple<int, int>> FlipStatistic1::_pairs = {
{61, 62},
{153, 154},
{154, 156},
{165, 166},
{79, 61},
{208, 224},
{153, 156},
{169, 172},
{169, 170},
{79, 87},
{165, 169},
{79, 62},
{166, 170},
{114, 120},
{113, 114},
{150, 154},
{114, 116},
{165, 170},
{166, 156},
{113, 116},
/*{113, 120},
{166, 169},
{165, 154},
{208, 209},
{154, 166},
{154, 155},
{169, 177},
{166, 172},
{150, 156},
{153, 165},
{108, 114},
{165, 172},
{224, 195},
{208, 195},
{106, 108},
{154, 169},
{87, 61},
{208, 210},
{150, 153},
{165, 156},
{224, 197},
{166, 167},
{156, 172},
{170, 172},
{166, 195},
{153, 114},
{154, 170},
{166, 177},
{208, 156},
{165, 177},
{106, 113},
{87, 91},
{208, 197},
{79, 91},
{166, 178},
{169, 156},
{208, 201},
{79, 108},
{156, 170},
{150, 166},
{165, 224},
{113, 108},
{224, 169},
{224, 201},
{156, 157},
{197, 198},
{208, 198},
{153, 166},
{108, 116},
{224, 166},
{224, 172},
{224, 225},
{170, 178},
{165, 195},
{154, 177},
{224, 226},
{195, 198},
{87, 62},
{208, 165},
{208, 154},
{106, 79},
{79, 166},
{79, 114},
{224, 170},
{195, 197},
{208, 170},
{150, 165},
{224, 177},
{224, 198},
{114, 87},
{208, 153},
{150, 151},
{153, 155},
{113, 79},
{154, 114},
{166, 180},
{114, 61},
{114, 115},
{87, 116},
{91, 94},
{208, 169},
{106, 107},
{79, 156},
{108, 120},
{108, 109},
{224, 202},
{166, 197},
{195, 169},
{169, 178},
{114, 91},
{116, 120},
{208, 166},
{208, 212},
{150, 116},
{153, 170},
{154, 116},
{154, 61},
{154, 172},
{79, 116},
{108, 91},
{177, 178},
{177, 184},
{153, 169},
{165, 197},
{165, 178},
{165, 167},
{113, 91},
{154, 195},
{154, 87},
{108, 110},
{224, 114},
{166, 198},
{169, 184},
{156, 180},
{87, 93},
{208, 177},
{150, 224},
{153, 113},
{153, 116},
{153, 177},
{113, 62},
{166, 62},
{195, 170},
{114, 62},
{156, 178},
{156, 158},
{87, 94},
{197, 209},
{116, 117},
{61, 91},
{208, 150},
{208, 172},
{208, 216},
{153, 224},
{153, 120},
{106, 114},
{113, 87},
{113, 61},
{154, 224},
{154, 62},
{154, 143},
{154, 178},
{224, 228},
{224, 240},
{169, 61},
{169, 120},
{156, 61},
{170, 177},
{170, 184},
{208, 178},
{150, 114},
{153, 143},
{165, 79},
{165, 116},
{113, 107},
{113, 115},
{154, 79},
{154, 91},
{79, 94},
{224, 116},
{169, 197},
{156, 116},
{156, 177},
{116, 62},
{177, 180},
{172, 180},
{93, 94},
{153, 108},
{153, 195},
{165, 198},
{106, 120},
{113, 156},
{154, 158},
{79, 169},
{195, 201},
{156, 120},
{156, 62},
{197, 170},
{116, 61},
{116, 172},
{120, 62},
{150, 170},
{150, 61},
{106, 116},
{154, 120},
{79, 103},
{108, 156},
{108, 87},
{108, 61},
{108, 62},
{108, 143},
{224, 62},
{224, 209},
{166, 114},
{166, 61},
{195, 202},
{169, 180},
{114, 103},
{156, 151},
{87, 103},
{170, 171},
{177, 172},
{91, 120},
{91, 93},
{201, 202},
{62, 63},
{208, 114},
{208, 120},
{150, 169},
{153, 106},
{153, 197},
{153, 172},
{153, 62},
{153, 151},
{165, 61},
{165, 120},
{165, 180},
{106, 154},
{106, 87},
{113, 169},
{113, 103},
{113, 93},
{154, 197},
{154, 198},
{154, 151},
{79, 170},
{79, 93},
{79, 107},
{224, 180},
{224, 204},
{224, 184},
{224, 232},
{195, 156},
{195, 177},
{169, 198},
{169, 201},
{114, 107},
{156, 87},
{156, 143},
{156, 209},
{197, 172},
{197, 202},
{197, 212},
{116, 110},
{170, 180},
{61, 93},
{120, 107},
{120, 122},
{62, 93},
{178, 184},
{208, 79},
{208, 116},
{208, 202},
{208, 155},
{150, 79},
{150, 87},
{150, 91},
{150, 143},
{153, 87},
{153, 61},
{153, 178},
{153, 180},
{165, 87},
{165, 151},
{165, 184},
{106, 166},
{106, 61},
{106, 93},
{113, 224},
{113, 143},
{154, 180},
{79, 177},
{79, 172},
{79, 120},
{108, 103},
{108, 93},
{224, 156},
{166, 87},
{166, 151},
{195, 172},
{195, 209},
{169, 116},
{114, 156},
{114, 118},
{156, 197},
{156, 184},
{87, 120},
{197, 201},
{116, 143},
{116, 107},
{170, 198},
{170, 120},
{61, 120},
{91, 62},
{172, 62},
{120, 93},
{178, 155},
{208, 106},
{208, 108},
{208, 87},
{208, 62},
{208, 184},
{150, 113},
{150, 177},
{150, 198},
{150, 172},
{150, 178},
{150, 180},
{153, 79},
{153, 91},
{153, 201},
{153, 93},
{153, 157},
{165, 108},
{165, 114},
{165, 62},
{106, 91},
{106, 110},
{113, 166},
{113, 170},
{113, 172},
{154, 108},
{154, 201},
{154, 94},
{154, 204},
{154, 210},
{154, 216},
{79, 195},
{79, 143},
{108, 169},
{108, 107},
{224, 91},
{224, 120},
{224, 178},
{166, 120},
{166, 201},
{166, 202},
{195, 210},
{169, 62},
{169, 202},
{169, 209},
{169, 204},
{169, 173},
{114, 170},
{114, 93},
{114, 180},
{156, 91},
{156, 198},
{156, 201},
{156, 202},
{156, 94},
{87, 143},
{87, 107},
{197, 116},
{197, 177},
{116, 91},
{116, 103},
{116, 118},
{170, 232},
{61, 177},
{61, 172},
{177, 120},
{177, 62},
{91, 103},
{91, 107},
{198, 209},
{198, 226},
{198, 199},
{172, 178},
{120, 180},
{201, 209},
{62, 143},
{103, 107},
{178, 210},
{208, 113},
{208, 61},
{208, 91},
{208, 103},
{208, 204},
{208, 225},
{150, 197},
{150, 120},
{150, 62},
{150, 93},
{153, 198},
{153, 202},
{153, 94},
{165, 91},
{165, 201},
{165, 143},
{165, 202},
{165, 209},
{165, 210},
{106, 62},
{106, 143},
{106, 103},
{106, 109},
{113, 195},
{113, 197},
{113, 198},
{154, 202},
{154, 107},
{154, 109},
{154, 184},
{154, 110},
{79, 197},
{79, 184},
{108, 166},
{108, 94},
{224, 61},
{224, 210},
{166, 116},
{166, 91},
{166, 143},
{166, 107},
{166, 204},
{166, 210},
{195, 87},
{195, 116},
{195, 91},
{195, 62},
{195, 178},
{195, 226},
{169, 87},
{169, 151},
{169, 155},
{169, 109},
{169, 225},
{169, 216},
{114, 197},
{114, 178},
{114, 109},
{114, 117},
{156, 93},
{156, 204},
{156, 155},
{156, 118},
{87, 170},
{87, 177},
{87, 172},
{87, 109},
{87, 115},
{116, 170},
{116, 177},
{116, 93},
{116, 94},
{116, 184},
{170, 61},
{170, 201},
{170, 107},
{170, 209},
{170, 155},
{170, 225},
{170, 226},
{61, 143},
{61, 103},
{61, 178},
{61, 180},
{61, 155},
{61, 110},
{61, 63},
{177, 155},
{198, 172},
{198, 120},
{198, 103},
{198, 178},
{198, 202},
{198, 204},
{198, 212},
{172, 120},
{172, 202},
{172, 184},
{172, 212},
{172, 173},
{172, 228},
{120, 110},
{120, 121},
{201, 204},
{62, 103},
{62, 107},
{62, 94},
{103, 93},
{103, 109},
{93, 151},
{202, 204},
{107, 110},
{180, 184},
{209, 240},
{208, 143},
{208, 180},
{208, 94},
{208, 115},
{208, 232},
{150, 106},
{150, 108},
{150, 201},
{150, 202},
{150, 209},
{150, 155},
{150, 158},
{153, 107},
{153, 209},
{153, 109},
{153, 115},
{153, 216},
{165, 113},
{165, 94},
{165, 204},
{165, 155},
{165, 109},
{165, 110},
{165, 226},
{165, 228},
{106, 169},
{106, 156},
{106, 170},
{106, 198},
{106, 212},
{113, 154},
{113, 209},
{113, 94},
{113, 225},
{113, 117},
{113, 199},
{154, 93},
{154, 115},
{154, 167},
{154, 157},
{79, 224},
{79, 178},
{79, 202},
{79, 180},
{79, 209},
{79, 110},
{108, 224},
{108, 195},
{108, 197},
{108, 170},
{108, 198},
{108, 201},
{108, 151},
{108, 209},
{108, 225},
{224, 87},
{224, 107},
{224, 212},
{166, 93},
{166, 115},
{166, 157},
{166, 110},
{166, 212},
{166, 216},
{166, 232},
{195, 114},
{195, 120},
{195, 93},
{195, 180},
{195, 204},
{195, 115},
{195, 225},
{169, 114},
{169, 107},
{169, 171},
{169, 228},
{114, 177},
{114, 198},
{114, 172},
{114, 201},
{114, 143},
{114, 151},
{114, 94},
{114, 210},
{114, 212},
{114, 226},
{114, 121},
{114, 228},
{156, 103},
{156, 210},
{156, 225},
{156, 212},
{156, 124},
{87, 201},
{87, 178},
{87, 180},
{87, 151},
{87, 155},
{87, 212},
{87, 171},
{87, 199},
{87, 228},
{197, 61},
{197, 91},
{197, 120},
{197, 143},
{197, 178},
{197, 180},
{197, 204},
{197, 109},
{197, 225},
{116, 178},
{116, 204},
{116, 210},
{116, 109},
{116, 115},
{116, 225},
{170, 62},
{170, 103},
{170, 202},
{170, 167},
{170, 157},
{170, 158},
{61, 202},
{61, 109},
{61, 184},
{61, 115},
{177, 198},
{177, 201},
{177, 103},
{177, 202},
{177, 204},
{177, 210},
{177, 109},
{177, 167},
{91, 143},
{91, 180},
{91, 204},
{91, 155},
{91, 184},
{198, 201},
{198, 143},
{198, 151},
{198, 94},
{198, 210},
{198, 225},
{198, 157},
{172, 201},
{172, 143},
{172, 107},
{172, 151},
{172, 204},
{172, 210},
{172, 167},
{172, 225},
{172, 232},
{120, 143},
{120, 178},
{120, 202},
{120, 109},
{120, 184},
{120, 225},
{120, 117},
{201, 143},
{201, 155},
{201, 212},
{201, 199},
{201, 232},
{62, 178},
{62, 155},
{62, 210},
{62, 228},
{143, 93},
{143, 202},
{143, 151},
{143, 94},
{143, 155},
{103, 115},
{178, 151},
{178, 109},
{178, 157},
{178, 110},
{178, 118},
{178, 179},
{178, 228},
{178, 182},
{93, 209},
{93, 155},
{93, 115},
{93, 157},
{202, 184},
{202, 225},
{202, 203},
{107, 115},
{180, 151},
{180, 204},
{180, 210},
{151, 209},
{151, 94},
{151, 155},
{209, 115},
{209, 225},
{209, 226},
{94, 109},
{94, 184},
{94, 95},
{204, 210},
{204, 226},
{204, 228},
{155, 210},
{210, 115},
{210, 216},
{109, 167},
{167, 225},
{167, 171}*/
};
