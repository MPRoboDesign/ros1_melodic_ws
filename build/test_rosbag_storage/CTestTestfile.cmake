# CMake generated Testfile for 
# Source directory: /home/madhav/Documents/ros1_melodic_ws/src/ros_comm/test/test_rosbag_storage
# Build directory: /home/madhav/Documents/ros1_melodic_ws/build/test_rosbag_storage
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_test_rosbag_storage_gtest_bag_player "/home/madhav/Documents/ros1_melodic_ws/build/test_rosbag_storage/catkin_generated/env_cached.sh" "/usr/bin/python3" "/home/madhav/Documents/ros1_melodic_ws/src/catkin/cmake/test/run_tests.py" "/home/madhav/Documents/ros1_melodic_ws/build/test_rosbag_storage/test_results/test_rosbag_storage/gtest-bag_player.xml" "--return-code" "/home/madhav/Documents/ros1_melodic_ws/devel/.private/test_rosbag_storage/lib/test_rosbag_storage/bag_player --gtest_output=xml:/home/madhav/Documents/ros1_melodic_ws/build/test_rosbag_storage/test_results/test_rosbag_storage/gtest-bag_player.xml")
set_tests_properties(_ctest_test_rosbag_storage_gtest_bag_player PROPERTIES  _BACKTRACE_TRIPLES "/home/madhav/Documents/ros1_melodic_ws/src/catkin/cmake/test/tests.cmake;160;add_test;/home/madhav/Documents/ros1_melodic_ws/src/catkin/cmake/test/gtest.cmake;98;catkin_run_tests_target;/home/madhav/Documents/ros1_melodic_ws/src/catkin/cmake/test/gtest.cmake;37;_catkin_add_google_test;/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/test/test_rosbag_storage/CMakeLists.txt;14;catkin_add_gtest;/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/test/test_rosbag_storage/CMakeLists.txt;0;")
add_test(_ctest_test_rosbag_storage_gtest_create_and_iterate_bag "/home/madhav/Documents/ros1_melodic_ws/build/test_rosbag_storage/catkin_generated/env_cached.sh" "/usr/bin/python3" "/home/madhav/Documents/ros1_melodic_ws/src/catkin/cmake/test/run_tests.py" "/home/madhav/Documents/ros1_melodic_ws/build/test_rosbag_storage/test_results/test_rosbag_storage/gtest-create_and_iterate_bag.xml" "--return-code" "/home/madhav/Documents/ros1_melodic_ws/devel/.private/test_rosbag_storage/lib/test_rosbag_storage/create_and_iterate_bag --gtest_output=xml:/home/madhav/Documents/ros1_melodic_ws/build/test_rosbag_storage/test_results/test_rosbag_storage/gtest-create_and_iterate_bag.xml")
set_tests_properties(_ctest_test_rosbag_storage_gtest_create_and_iterate_bag PROPERTIES  _BACKTRACE_TRIPLES "/home/madhav/Documents/ros1_melodic_ws/src/catkin/cmake/test/tests.cmake;160;add_test;/home/madhav/Documents/ros1_melodic_ws/src/catkin/cmake/test/gtest.cmake;98;catkin_run_tests_target;/home/madhav/Documents/ros1_melodic_ws/src/catkin/cmake/test/gtest.cmake;37;_catkin_add_google_test;/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/test/test_rosbag_storage/CMakeLists.txt;18;catkin_add_gtest;/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/test/test_rosbag_storage/CMakeLists.txt;0;")
add_test(_ctest_test_rosbag_storage_gtest_swap_bags "/home/madhav/Documents/ros1_melodic_ws/build/test_rosbag_storage/catkin_generated/env_cached.sh" "/usr/bin/python3" "/home/madhav/Documents/ros1_melodic_ws/src/catkin/cmake/test/run_tests.py" "/home/madhav/Documents/ros1_melodic_ws/build/test_rosbag_storage/test_results/test_rosbag_storage/gtest-swap_bags.xml" "--return-code" "/home/madhav/Documents/ros1_melodic_ws/devel/.private/test_rosbag_storage/lib/test_rosbag_storage/swap_bags --gtest_output=xml:/home/madhav/Documents/ros1_melodic_ws/build/test_rosbag_storage/test_results/test_rosbag_storage/gtest-swap_bags.xml")
set_tests_properties(_ctest_test_rosbag_storage_gtest_swap_bags PROPERTIES  _BACKTRACE_TRIPLES "/home/madhav/Documents/ros1_melodic_ws/src/catkin/cmake/test/tests.cmake;160;add_test;/home/madhav/Documents/ros1_melodic_ws/src/catkin/cmake/test/gtest.cmake;98;catkin_run_tests_target;/home/madhav/Documents/ros1_melodic_ws/src/catkin/cmake/test/gtest.cmake;37;_catkin_add_google_test;/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/test/test_rosbag_storage/CMakeLists.txt;22;catkin_add_gtest;/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/test/test_rosbag_storage/CMakeLists.txt;0;")
subdirs("gtest")