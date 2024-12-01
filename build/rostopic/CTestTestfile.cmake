# CMake generated Testfile for 
# Source directory: /home/madhav/Documents/ros1_melodic_ws/src/ros_comm/tools/rostopic
# Build directory: /home/madhav/Documents/ros1_melodic_ws/build/rostopic
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_rostopic_rostest_test_rostopic.test "/home/madhav/Documents/ros1_melodic_ws/build/rostopic/catkin_generated/env_cached.sh" "/usr/bin/python3" "/home/madhav/Documents/ros1_melodic_ws/src/catkin/cmake/test/run_tests.py" "/home/madhav/Documents/ros1_melodic_ws/build/rostopic/test_results/rostopic/rostest-test_rostopic.xml" "--return-code" "/usr/bin/python3 /home/madhav/Documents/ros1_melodic_ws/src/ros_comm/tools/rostest/scripts/rostest --pkgdir=/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/tools/rostopic --package=rostopic --results-filename test_rostopic.xml --results-base-dir \"/home/madhav/Documents/ros1_melodic_ws/build/rostopic/test_results\" /home/madhav/Documents/ros1_melodic_ws/src/ros_comm/tools/rostopic/test/rostopic.test ")
set_tests_properties(_ctest_rostopic_rostest_test_rostopic.test PROPERTIES  _BACKTRACE_TRIPLES "/home/madhav/Documents/ros1_melodic_ws/src/catkin/cmake/test/tests.cmake;160;add_test;/home/madhav/Documents/ros1_melodic_ws/devel/share/rostest/cmake/rostest-extras.cmake;52;catkin_run_tests_target;/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/tools/rostopic/CMakeLists.txt;13;add_rostest;/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/tools/rostopic/CMakeLists.txt;0;")
subdirs("gtest")
