# CMake generated Testfile for 
# Source directory: /home/madhav/Documents/ros1_melodic_ws/src/ros_comm/test/test_rosgraph
# Build directory: /home/madhav/Documents/ros1_melodic_ws/build/test_rosgraph
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_test_rosgraph_rostest_test_masterapi.test "/home/madhav/Documents/ros1_melodic_ws/build/test_rosgraph/catkin_generated/env_cached.sh" "/usr/bin/python3" "/home/madhav/Documents/ros1_melodic_ws/src/catkin/cmake/test/run_tests.py" "/home/madhav/Documents/ros1_melodic_ws/build/test_rosgraph/test_results/test_rosgraph/rostest-test_masterapi.xml" "--return-code" "/usr/bin/python3 /home/madhav/Documents/ros1_melodic_ws/src/ros_comm/tools/rostest/scripts/rostest --pkgdir=/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/test/test_rosgraph --package=test_rosgraph --results-filename test_masterapi.xml --results-base-dir \"/home/madhav/Documents/ros1_melodic_ws/build/test_rosgraph/test_results\" /home/madhav/Documents/ros1_melodic_ws/src/ros_comm/test/test_rosgraph/test/masterapi.test ")
set_tests_properties(_ctest_test_rosgraph_rostest_test_masterapi.test PROPERTIES  _BACKTRACE_TRIPLES "/home/madhav/Documents/ros1_melodic_ws/src/catkin/cmake/test/tests.cmake;160;add_test;/home/madhav/Documents/ros1_melodic_ws/devel/share/rostest/cmake/rostest-extras.cmake;52;catkin_run_tests_target;/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/test/test_rosgraph/CMakeLists.txt;8;add_rostest;/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/test/test_rosgraph/CMakeLists.txt;0;")
subdirs("gtest")
