# CMake generated Testfile for 
# Source directory: /home/madhav/Documents/ros1_melodic_ws/src/ros_comm/tools/rosnode
# Build directory: /home/madhav/Documents/ros1_melodic_ws/build/rosnode
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_rosnode_rostest_test_rosnode.test "/home/madhav/Documents/ros1_melodic_ws/build/rosnode/catkin_generated/env_cached.sh" "/usr/bin/python3" "/home/madhav/Documents/ros1_melodic_ws/src/catkin/cmake/test/run_tests.py" "/home/madhav/Documents/ros1_melodic_ws/build/rosnode/test_results/rosnode/rostest-test_rosnode.xml" "--return-code" "/usr/bin/python3 /home/madhav/Documents/ros1_melodic_ws/src/ros_comm/tools/rostest/scripts/rostest --pkgdir=/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/tools/rosnode --package=rosnode --results-filename test_rosnode.xml --results-base-dir \"/home/madhav/Documents/ros1_melodic_ws/build/rosnode/test_results\" /home/madhav/Documents/ros1_melodic_ws/src/ros_comm/tools/rosnode/test/rosnode.test ")
set_tests_properties(_ctest_rosnode_rostest_test_rosnode.test PROPERTIES  _BACKTRACE_TRIPLES "/home/madhav/Documents/ros1_melodic_ws/src/catkin/cmake/test/tests.cmake;160;add_test;/home/madhav/Documents/ros1_melodic_ws/devel/share/rostest/cmake/rostest-extras.cmake;52;catkin_run_tests_target;/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/tools/rosnode/CMakeLists.txt;10;add_rostest;/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/tools/rosnode/CMakeLists.txt;0;")
subdirs("gtest")
