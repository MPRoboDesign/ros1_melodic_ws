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
CMAKE_SOURCE_DIR = /home/madhav/Documents/ros1_melodic_ws/src/ros_comm/utilities/xmlrpcpp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/madhav/Documents/ros1_melodic_ws/build/xmlrpcpp

# Utility rule file for _run_tests_xmlrpcpp_gtest_TestXml.

# Include any custom commands dependencies for this target.
include test/CMakeFiles/_run_tests_xmlrpcpp_gtest_TestXml.dir/compiler_depend.make

# Include the progress variables for this target.
include test/CMakeFiles/_run_tests_xmlrpcpp_gtest_TestXml.dir/progress.make

test/CMakeFiles/_run_tests_xmlrpcpp_gtest_TestXml:
	cd /home/madhav/Documents/ros1_melodic_ws/build/xmlrpcpp/test && ../catkin_generated/env_cached.sh /usr/bin/python3 /home/madhav/Documents/ros1_melodic_ws/src/catkin/cmake/test/run_tests.py /home/madhav/Documents/ros1_melodic_ws/build/xmlrpcpp/test_results/xmlrpcpp/gtest-TestXml.xml "/home/madhav/Documents/ros1_melodic_ws/devel/.private/xmlrpcpp/lib/xmlrpcpp/TestXml --gtest_output=xml:/home/madhav/Documents/ros1_melodic_ws/build/xmlrpcpp/test_results/xmlrpcpp/gtest-TestXml.xml"

_run_tests_xmlrpcpp_gtest_TestXml: test/CMakeFiles/_run_tests_xmlrpcpp_gtest_TestXml
_run_tests_xmlrpcpp_gtest_TestXml: test/CMakeFiles/_run_tests_xmlrpcpp_gtest_TestXml.dir/build.make
.PHONY : _run_tests_xmlrpcpp_gtest_TestXml

# Rule to build all files generated by this target.
test/CMakeFiles/_run_tests_xmlrpcpp_gtest_TestXml.dir/build: _run_tests_xmlrpcpp_gtest_TestXml
.PHONY : test/CMakeFiles/_run_tests_xmlrpcpp_gtest_TestXml.dir/build

test/CMakeFiles/_run_tests_xmlrpcpp_gtest_TestXml.dir/clean:
	cd /home/madhav/Documents/ros1_melodic_ws/build/xmlrpcpp/test && $(CMAKE_COMMAND) -P CMakeFiles/_run_tests_xmlrpcpp_gtest_TestXml.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/_run_tests_xmlrpcpp_gtest_TestXml.dir/clean

test/CMakeFiles/_run_tests_xmlrpcpp_gtest_TestXml.dir/depend:
	cd /home/madhav/Documents/ros1_melodic_ws/build/xmlrpcpp && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/madhav/Documents/ros1_melodic_ws/src/ros_comm/utilities/xmlrpcpp /home/madhav/Documents/ros1_melodic_ws/src/ros_comm/utilities/xmlrpcpp/test /home/madhav/Documents/ros1_melodic_ws/build/xmlrpcpp /home/madhav/Documents/ros1_melodic_ws/build/xmlrpcpp/test /home/madhav/Documents/ros1_melodic_ws/build/xmlrpcpp/test/CMakeFiles/_run_tests_xmlrpcpp_gtest_TestXml.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : test/CMakeFiles/_run_tests_xmlrpcpp_gtest_TestXml.dir/depend

