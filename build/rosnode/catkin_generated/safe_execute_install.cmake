execute_process(COMMAND "/home/madhav/Documents/ros1_melodic_ws/build/rosnode/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/madhav/Documents/ros1_melodic_ws/build/rosnode/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
