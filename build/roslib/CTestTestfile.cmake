# CMake generated Testfile for 
# Source directory: /home/madhav/Documents/ros1_melodic_ws/src/ros/core/roslib
# Build directory: /home/madhav/Documents/ros1_melodic_ws/build/roslib
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_roslib_gtest_roslib-utest "/home/madhav/Documents/ros1_melodic_ws/build/roslib/catkin_generated/env_cached.sh" "/usr/bin/python3" "/home/madhav/Documents/ros1_melodic_ws/src/catkin/cmake/test/run_tests.py" "/home/madhav/Documents/ros1_melodic_ws/build/roslib/test_results/roslib/gtest-roslib-utest.xml" "--working-dir" "/home/madhav/Documents/ros1_melodic_ws/src/ros/core/roslib" "--return-code" "/home/madhav/Documents/ros1_melodic_ws/devel/.private/roslib/lib/roslib/roslib-utest --gtest_output=xml:/home/madhav/Documents/ros1_melodic_ws/build/roslib/test_results/roslib/gtest-roslib-utest.xml")
set_tests_properties(_ctest_roslib_gtest_roslib-utest PROPERTIES  _BACKTRACE_TRIPLES "/home/madhav/Documents/ros1_melodic_ws/src/catkin/cmake/test/tests.cmake;160;add_test;/home/madhav/Documents/ros1_melodic_ws/src/catkin/cmake/test/gtest.cmake;98;catkin_run_tests_target;/home/madhav/Documents/ros1_melodic_ws/src/catkin/cmake/test/gtest.cmake;37;_catkin_add_google_test;/home/madhav/Documents/ros1_melodic_ws/src/ros/core/roslib/CMakeLists.txt;45;catkin_add_gtest;/home/madhav/Documents/ros1_melodic_ws/src/ros/core/roslib/CMakeLists.txt;0;")
add_test(_ctest_roslib_gtest_roslib-test_package "/home/madhav/Documents/ros1_melodic_ws/build/roslib/catkin_generated/env_cached.sh" "/usr/bin/python3" "/home/madhav/Documents/ros1_melodic_ws/src/catkin/cmake/test/run_tests.py" "/home/madhav/Documents/ros1_melodic_ws/build/roslib/test_results/roslib/gtest-roslib-test_package.xml" "--return-code" "/home/madhav/Documents/ros1_melodic_ws/devel/.private/roslib/lib/roslib/roslib-test_package --gtest_output=xml:/home/madhav/Documents/ros1_melodic_ws/build/roslib/test_results/roslib/gtest-roslib-test_package.xml")
set_tests_properties(_ctest_roslib_gtest_roslib-test_package PROPERTIES  _BACKTRACE_TRIPLES "/home/madhav/Documents/ros1_melodic_ws/src/catkin/cmake/test/tests.cmake;160;add_test;/home/madhav/Documents/ros1_melodic_ws/src/catkin/cmake/test/gtest.cmake;98;catkin_run_tests_target;/home/madhav/Documents/ros1_melodic_ws/src/catkin/cmake/test/gtest.cmake;37;_catkin_add_google_test;/home/madhav/Documents/ros1_melodic_ws/src/ros/core/roslib/CMakeLists.txt;50;catkin_add_gtest;/home/madhav/Documents/ros1_melodic_ws/src/ros/core/roslib/CMakeLists.txt;0;")
subdirs("gtest")
