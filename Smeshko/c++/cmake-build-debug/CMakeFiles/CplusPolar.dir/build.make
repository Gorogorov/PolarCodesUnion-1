# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.15

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/smeshko/Documents/cody/polar/CplusPolar

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/smeshko/Documents/cody/polar/CplusPolar/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/CplusPolar.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/CplusPolar.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/CplusPolar.dir/flags.make

CMakeFiles/CplusPolar.dir/main.cpp.o: CMakeFiles/CplusPolar.dir/flags.make
CMakeFiles/CplusPolar.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/smeshko/Documents/cody/polar/CplusPolar/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/CplusPolar.dir/main.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/CplusPolar.dir/main.cpp.o -c /Users/smeshko/Documents/cody/polar/CplusPolar/main.cpp

CMakeFiles/CplusPolar.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/CplusPolar.dir/main.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/smeshko/Documents/cody/polar/CplusPolar/main.cpp > CMakeFiles/CplusPolar.dir/main.cpp.i

CMakeFiles/CplusPolar.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/CplusPolar.dir/main.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/smeshko/Documents/cody/polar/CplusPolar/main.cpp -o CMakeFiles/CplusPolar.dir/main.cpp.s

# Object files for target CplusPolar
CplusPolar_OBJECTS = \
"CMakeFiles/CplusPolar.dir/main.cpp.o"

# External object files for target CplusPolar
CplusPolar_EXTERNAL_OBJECTS =

CplusPolar: CMakeFiles/CplusPolar.dir/main.cpp.o
CplusPolar: CMakeFiles/CplusPolar.dir/build.make
CplusPolar: CMakeFiles/CplusPolar.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/smeshko/Documents/cody/polar/CplusPolar/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable CplusPolar"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/CplusPolar.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/CplusPolar.dir/build: CplusPolar

.PHONY : CMakeFiles/CplusPolar.dir/build

CMakeFiles/CplusPolar.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/CplusPolar.dir/cmake_clean.cmake
.PHONY : CMakeFiles/CplusPolar.dir/clean

CMakeFiles/CplusPolar.dir/depend:
	cd /Users/smeshko/Documents/cody/polar/CplusPolar/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/smeshko/Documents/cody/polar/CplusPolar /Users/smeshko/Documents/cody/polar/CplusPolar /Users/smeshko/Documents/cody/polar/CplusPolar/cmake-build-debug /Users/smeshko/Documents/cody/polar/CplusPolar/cmake-build-debug /Users/smeshko/Documents/cody/polar/CplusPolar/cmake-build-debug/CMakeFiles/CplusPolar.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/CplusPolar.dir/depend
