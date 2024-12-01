# Install script for directory: /home/madhav/Documents/ros1_melodic_ws/src/ros_comm/test/test_rosbag/bag_migration_tests

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/madhav/Documents/ros1_melodic_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set path to fallback-tool for dependency-resolution.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/test_rosbag/msg_current" TYPE FILE FILES
    "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/test/test_rosbag/bag_migration_tests/msg_current/Converged.msg"
    "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/test/test_rosbag/bag_migration_tests/msg_current/MigratedAddSub.msg"
    "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/test/test_rosbag/bag_migration_tests/msg_current/MigratedExplicit.msg"
    "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/test/test_rosbag/bag_migration_tests/msg_current/MigratedImplicit.msg"
    "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/test/test_rosbag/bag_migration_tests/msg_current/MigratedMixed.msg"
    "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/test/test_rosbag/bag_migration_tests/msg_current/PartiallyMigrated.msg"
    "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/test/test_rosbag/bag_migration_tests/msg_current/Simple.msg"
    "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/test/test_rosbag/bag_migration_tests/msg_current/SimpleMigrated.msg"
    "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/test/test_rosbag/bag_migration_tests/msg_current/SubUnmigrated.msg"
    "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/test/test_rosbag/bag_migration_tests/msg_current/Unmigrated.msg"
    "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/test/test_rosbag/bag_migration_tests/msg_current/Constants.msg"
    "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/test/test_rosbag/bag_migration_tests/msg_current/Renamed5.msg"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/test_rosbag/cmake" TYPE FILE FILES "/home/madhav/Documents/ros1_melodic_ws/build/test_rosbag/bag_migration_tests/catkin_generated/installspace/test_rosbag-msg-paths.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/madhav/Documents/ros1_melodic_ws/devel/.private/test_rosbag/include/test_rosbag")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/madhav/Documents/ros1_melodic_ws/devel/.private/test_rosbag/share/roseus/ros/test_rosbag")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/madhav/Documents/ros1_melodic_ws/devel/.private/test_rosbag/share/common-lisp/ros/test_rosbag")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/madhav/Documents/ros1_melodic_ws/devel/.private/test_rosbag/share/gennodejs/ros/test_rosbag")
endif()

