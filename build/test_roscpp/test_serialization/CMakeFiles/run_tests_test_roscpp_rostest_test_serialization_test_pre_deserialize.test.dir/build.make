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
CMAKE_SOURCE_DIR = /home/madhav/Documents/ros1_melodic_ws/src/ros_comm/test/test_roscpp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/madhav/Documents/ros1_melodic_ws/build/test_roscpp

# Utility rule file for run_tests_test_roscpp_rostest_test_serialization_test_pre_deserialize.test.

# Include any custom commands dependencies for this target.
include test_serialization/CMakeFiles/run_tests_test_roscpp_rostest_test_serialization_test_pre_deserialize.test.dir/compiler_depend.make

# Include the progress variables for this target.
include test_serialization/CMakeFiles/run_tests_test_roscpp_rostest_test_serialization_test_pre_deserialize.test.dir/progress.make

test_serialization/CMakeFiles/run_tests_test_roscpp_rostest_test_serialization_test_pre_deserialize.test:
	cd /home/madhav/Documents/ros1_melodic_ws/build/test_roscpp/test_serialization && ../catkin_generated/env_cached.sh /usr/bin/python3 /home/madhav/Documents/ros1_melodic_ws/src/catkin/cmake/test/run_tests.py /home/madhav/Documents/ros1_melodic_ws/build/test_roscpp/test_results/test_roscpp/rostest-test_serialization_test_pre_deserialize.xml "/usr/bin/python3 /home/madhav/Documents/ros1_melodic_ws/src/ros_comm/tools/rostest/scripts/rostest --pkgdir=/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/test/test_roscpp --package=test_roscpp --results-filename test_serialization_test_pre_deserialize.xml --results-base-dir \"/home/madhav/Documents/ros1_melodic_ws/build/test_roscpp/test_results\" /home/madhav/Documents/ros1_melodic_ws/src/ros_comm/test/test_roscpp/test_serialization/test/pre_deserialize.test "

run_tests_test_roscpp_rostest_test_serialization_test_pre_deserialize.test: test_serialization/CMakeFiles/run_tests_test_roscpp_rostest_test_serialization_test_pre_deserialize.test
run_tests_test_roscpp_rostest_test_serialization_test_pre_deserialize.test: test_serialization/CMakeFiles/run_tests_test_roscpp_rostest_test_serialization_test_pre_deserialize.test.dir/build.make
.PHONY : run_tests_test_roscpp_rostest_test_serialization_test_pre_deserialize.test

# Rule to build all files generated by this target.
test_serialization/CMakeFiles/run_tests_test_roscpp_rostest_test_serialization_test_pre_deserialize.test.dir/build: run_tests_test_roscpp_rostest_test_serialization_test_pre_deserialize.test
.PHONY : test_serialization/CMakeFiles/run_tests_test_roscpp_rostest_test_serialization_test_pre_deserialize.test.dir/build

test_serialization/CMakeFiles/run_tests_test_roscpp_rostest_test_serialization_test_pre_deserialize.test.dir/clean:
	cd /home/madhav/Documents/ros1_melodic_ws/build/test_roscpp/test_serialization && $(CMAKE_COMMAND) -P CMakeFiles/run_tests_test_roscpp_rostest_test_serialization_test_pre_deserialize.test.dir/cmake_clean.cmake
.PHONY : test_serialization/CMakeFiles/run_tests_test_roscpp_rostest_test_serialization_test_pre_deserialize.test.dir/clean

test_serialization/CMakeFiles/run_tests_test_roscpp_rostest_test_serialization_test_pre_deserialize.test.dir/depend:
	cd /home/madhav/Documents/ros1_melodic_ws/build/test_roscpp && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/madhav/Documents/ros1_melodic_ws/src/ros_comm/test/test_roscpp /home/madhav/Documents/ros1_melodic_ws/src/ros_comm/test/test_roscpp/test_serialization /home/madhav/Documents/ros1_melodic_ws/build/test_roscpp /home/madhav/Documents/ros1_melodic_ws/build/test_roscpp/test_serialization /home/madhav/Documents/ros1_melodic_ws/build/test_roscpp/test_serialization/CMakeFiles/run_tests_test_roscpp_rostest_test_serialization_test_pre_deserialize.test.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : test_serialization/CMakeFiles/run_tests_test_roscpp_rostest_test_serialization_test_pre_deserialize.test.dir/depend
