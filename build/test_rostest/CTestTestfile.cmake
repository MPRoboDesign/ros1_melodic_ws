# CMake generated Testfile for 
# Source directory: /home/madhav/Documents/ros1_melodic_ws/src/ros_comm/test/test_rostest
# Build directory: /home/madhav/Documents/ros1_melodic_ws/build/test_rostest
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_test_rostest_rostest_test_publishtest.test "/home/madhav/Documents/ros1_melodic_ws/build/test_rostest/catkin_generated/env_cached.sh" "/usr/bin/python3" "/home/madhav/Documents/ros1_melodic_ws/src/catkin/cmake/test/run_tests.py" "/home/madhav/Documents/ros1_melodic_ws/build/test_rostest/test_results/test_rostest/rostest-test_publishtest.xml" "--return-code" "/usr/bin/python3 /home/madhav/Documents/ros1_melodic_ws/src/ros_comm/tools/rostest/scripts/rostest --pkgdir=/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/test/test_rostest --package=test_rostest --results-filename test_publishtest.xml --results-base-dir \"/home/madhav/Documents/ros1_melodic_ws/build/test_rostest/test_results\" /home/madhav/Documents/ros1_melodic_ws/src/ros_comm/test/test_rostest/test/publishtest.test ")
set_tests_properties(_ctest_test_rostest_rostest_test_publishtest.test PROPERTIES  _BACKTRACE_TRIPLES "/home/madhav/Documents/ros1_melodic_ws/src/catkin/cmake/test/tests.cmake;160;add_test;/home/madhav/Documents/ros1_melodic_ws/devel/share/rostest/cmake/rostest-extras.cmake;52;catkin_run_tests_target;/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/test/test_rostest/CMakeLists.txt;10;add_rostest;/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/test/test_rostest/CMakeLists.txt;0;")
subdirs("gtest")
