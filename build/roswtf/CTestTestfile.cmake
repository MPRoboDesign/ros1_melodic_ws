# CMake generated Testfile for 
# Source directory: /home/madhav/Documents/ros1_melodic_ws/src/ros_comm/utilities/roswtf
# Build directory: /home/madhav/Documents/ros1_melodic_ws/build/roswtf
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_roswtf_rostest_test_roswtf.test "/home/madhav/Documents/ros1_melodic_ws/build/roswtf/catkin_generated/env_cached.sh" "/usr/bin/python3" "/home/madhav/Documents/ros1_melodic_ws/src/catkin/cmake/test/run_tests.py" "/home/madhav/Documents/ros1_melodic_ws/build/roswtf/test_results/roswtf/rostest-test_roswtf.xml" "--return-code" "/usr/bin/python3 /home/madhav/Documents/ros1_melodic_ws/src/ros_comm/tools/rostest/scripts/rostest --pkgdir=/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/utilities/roswtf --package=roswtf --results-filename test_roswtf.xml --results-base-dir \"/home/madhav/Documents/ros1_melodic_ws/build/roswtf/test_results\" /home/madhav/Documents/ros1_melodic_ws/src/ros_comm/utilities/roswtf/test/roswtf.test ")
set_tests_properties(_ctest_roswtf_rostest_test_roswtf.test PROPERTIES  _BACKTRACE_TRIPLES "/home/madhav/Documents/ros1_melodic_ws/src/catkin/cmake/test/tests.cmake;160;add_test;/home/madhav/Documents/ros1_melodic_ws/devel/share/rostest/cmake/rostest-extras.cmake;52;catkin_run_tests_target;/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/utilities/roswtf/CMakeLists.txt;9;add_rostest;/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/utilities/roswtf/CMakeLists.txt;0;")
subdirs("gtest")
