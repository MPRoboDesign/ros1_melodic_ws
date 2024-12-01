# CMake generated Testfile for 
# Source directory: /home/madhav/Documents/ros1_melodic_ws/src/ros_comm/test/test_rosparam
# Build directory: /home/madhav/Documents/ros1_melodic_ws/build/test_rosparam
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_test_rosparam_rostest_test_rosparam.test "/home/madhav/Documents/ros1_melodic_ws/build/test_rosparam/catkin_generated/env_cached.sh" "/usr/bin/python3" "/home/madhav/Documents/ros1_melodic_ws/src/catkin/cmake/test/run_tests.py" "/home/madhav/Documents/ros1_melodic_ws/build/test_rosparam/test_results/test_rosparam/rostest-test_rosparam.xml" "--return-code" "/usr/bin/python3 /home/madhav/Documents/ros1_melodic_ws/src/ros_comm/tools/rostest/scripts/rostest --pkgdir=/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/test/test_rosparam --package=test_rosparam --results-filename test_rosparam.xml --results-base-dir \"/home/madhav/Documents/ros1_melodic_ws/build/test_rosparam/test_results\" /home/madhav/Documents/ros1_melodic_ws/src/ros_comm/test/test_rosparam/test/rosparam.test ")
set_tests_properties(_ctest_test_rosparam_rostest_test_rosparam.test PROPERTIES  _BACKTRACE_TRIPLES "/home/madhav/Documents/ros1_melodic_ws/src/catkin/cmake/test/tests.cmake;160;add_test;/home/madhav/Documents/ros1_melodic_ws/devel/share/rostest/cmake/rostest-extras.cmake;52;catkin_run_tests_target;/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/test/test_rosparam/CMakeLists.txt;8;add_rostest;/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/test/test_rosparam/CMakeLists.txt;0;")
subdirs("gtest")
