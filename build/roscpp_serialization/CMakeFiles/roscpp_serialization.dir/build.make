# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.30

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/madhav/Documents/ros1_melodic_ws/src/roscpp_core/roscpp_serialization

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/madhav/Documents/ros1_melodic_ws/build/roscpp_serialization

# Include any dependencies generated for this target.
include CMakeFiles/roscpp_serialization.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/roscpp_serialization.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/roscpp_serialization.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/roscpp_serialization.dir/flags.make

CMakeFiles/roscpp_serialization.dir/src/serialization.cpp.o: CMakeFiles/roscpp_serialization.dir/flags.make
CMakeFiles/roscpp_serialization.dir/src/serialization.cpp.o: /home/madhav/Documents/ros1_melodic_ws/src/roscpp_core/roscpp_serialization/src/serialization.cpp
CMakeFiles/roscpp_serialization.dir/src/serialization.cpp.o: CMakeFiles/roscpp_serialization.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/madhav/Documents/ros1_melodic_ws/build/roscpp_serialization/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/roscpp_serialization.dir/src/serialization.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/roscpp_serialization.dir/src/serialization.cpp.o -MF CMakeFiles/roscpp_serialization.dir/src/serialization.cpp.o.d -o CMakeFiles/roscpp_serialization.dir/src/serialization.cpp.o -c /home/madhav/Documents/ros1_melodic_ws/src/roscpp_core/roscpp_serialization/src/serialization.cpp

CMakeFiles/roscpp_serialization.dir/src/serialization.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/roscpp_serialization.dir/src/serialization.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/madhav/Documents/ros1_melodic_ws/src/roscpp_core/roscpp_serialization/src/serialization.cpp > CMakeFiles/roscpp_serialization.dir/src/serialization.cpp.i

CMakeFiles/roscpp_serialization.dir/src/serialization.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/roscpp_serialization.dir/src/serialization.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/madhav/Documents/ros1_melodic_ws/src/roscpp_core/roscpp_serialization/src/serialization.cpp -o CMakeFiles/roscpp_serialization.dir/src/serialization.cpp.s

# Object files for target roscpp_serialization
roscpp_serialization_OBJECTS = \
"CMakeFiles/roscpp_serialization.dir/src/serialization.cpp.o"

# External object files for target roscpp_serialization
roscpp_serialization_EXTERNAL_OBJECTS =

/home/madhav/Documents/ros1_melodic_ws/devel/.private/roscpp_serialization/lib/libroscpp_serialization.so: CMakeFiles/roscpp_serialization.dir/src/serialization.cpp.o
/home/madhav/Documents/ros1_melodic_ws/devel/.private/roscpp_serialization/lib/libroscpp_serialization.so: CMakeFiles/roscpp_serialization.dir/build.make
/home/madhav/Documents/ros1_melodic_ws/devel/.private/roscpp_serialization/lib/libroscpp_serialization.so: CMakeFiles/roscpp_serialization.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/madhav/Documents/ros1_melodic_ws/build/roscpp_serialization/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library /home/madhav/Documents/ros1_melodic_ws/devel/.private/roscpp_serialization/lib/libroscpp_serialization.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/roscpp_serialization.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/roscpp_serialization.dir/build: /home/madhav/Documents/ros1_melodic_ws/devel/.private/roscpp_serialization/lib/libroscpp_serialization.so
.PHONY : CMakeFiles/roscpp_serialization.dir/build

CMakeFiles/roscpp_serialization.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/roscpp_serialization.dir/cmake_clean.cmake
.PHONY : CMakeFiles/roscpp_serialization.dir/clean

CMakeFiles/roscpp_serialization.dir/depend:
	cd /home/madhav/Documents/ros1_melodic_ws/build/roscpp_serialization && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/madhav/Documents/ros1_melodic_ws/src/roscpp_core/roscpp_serialization /home/madhav/Documents/ros1_melodic_ws/src/roscpp_core/roscpp_serialization /home/madhav/Documents/ros1_melodic_ws/build/roscpp_serialization /home/madhav/Documents/ros1_melodic_ws/build/roscpp_serialization /home/madhav/Documents/ros1_melodic_ws/build/roscpp_serialization/CMakeFiles/roscpp_serialization.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/roscpp_serialization.dir/depend

