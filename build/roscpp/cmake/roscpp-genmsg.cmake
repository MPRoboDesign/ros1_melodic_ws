# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "roscpp: 1 messages, 3 services")

set(MSG_I_FLAGS "-Iroscpp:/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)

add_custom_target(roscpp_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/msg/Logger.msg" NAME_WE)
add_custom_target(_roscpp_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "roscpp" "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/msg/Logger.msg" ""
)

get_filename_component(_filename "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/srv/Empty.srv" NAME_WE)
add_custom_target(_roscpp_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "roscpp" "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/srv/Empty.srv" ""
)

get_filename_component(_filename "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/srv/GetLoggers.srv" NAME_WE)
add_custom_target(_roscpp_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "roscpp" "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/srv/GetLoggers.srv" "roscpp/Logger"
)

get_filename_component(_filename "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/srv/SetLoggerLevel.srv" NAME_WE)
add_custom_target(_roscpp_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "roscpp" "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/srv/SetLoggerLevel.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(roscpp
  "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/msg/Logger.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/roscpp
)

### Generating Services
_generate_srv_cpp(roscpp
  "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/srv/Empty.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/roscpp
)
_generate_srv_cpp(roscpp
  "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/srv/GetLoggers.srv"
  "${MSG_I_FLAGS}"
  "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/msg/Logger.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/roscpp
)
_generate_srv_cpp(roscpp
  "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/srv/SetLoggerLevel.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/roscpp
)

### Generating Module File
_generate_module_cpp(roscpp
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/roscpp
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(roscpp_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(roscpp_generate_messages roscpp_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/msg/Logger.msg" NAME_WE)
add_dependencies(roscpp_generate_messages_cpp _roscpp_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/srv/Empty.srv" NAME_WE)
add_dependencies(roscpp_generate_messages_cpp _roscpp_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/srv/GetLoggers.srv" NAME_WE)
add_dependencies(roscpp_generate_messages_cpp _roscpp_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/srv/SetLoggerLevel.srv" NAME_WE)
add_dependencies(roscpp_generate_messages_cpp _roscpp_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(roscpp_gencpp)
add_dependencies(roscpp_gencpp roscpp_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS roscpp_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(roscpp
  "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/msg/Logger.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/roscpp
)

### Generating Services
_generate_srv_eus(roscpp
  "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/srv/Empty.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/roscpp
)
_generate_srv_eus(roscpp
  "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/srv/GetLoggers.srv"
  "${MSG_I_FLAGS}"
  "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/msg/Logger.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/roscpp
)
_generate_srv_eus(roscpp
  "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/srv/SetLoggerLevel.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/roscpp
)

### Generating Module File
_generate_module_eus(roscpp
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/roscpp
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(roscpp_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(roscpp_generate_messages roscpp_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/msg/Logger.msg" NAME_WE)
add_dependencies(roscpp_generate_messages_eus _roscpp_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/srv/Empty.srv" NAME_WE)
add_dependencies(roscpp_generate_messages_eus _roscpp_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/srv/GetLoggers.srv" NAME_WE)
add_dependencies(roscpp_generate_messages_eus _roscpp_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/srv/SetLoggerLevel.srv" NAME_WE)
add_dependencies(roscpp_generate_messages_eus _roscpp_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(roscpp_geneus)
add_dependencies(roscpp_geneus roscpp_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS roscpp_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(roscpp
  "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/msg/Logger.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/roscpp
)

### Generating Services
_generate_srv_lisp(roscpp
  "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/srv/Empty.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/roscpp
)
_generate_srv_lisp(roscpp
  "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/srv/GetLoggers.srv"
  "${MSG_I_FLAGS}"
  "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/msg/Logger.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/roscpp
)
_generate_srv_lisp(roscpp
  "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/srv/SetLoggerLevel.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/roscpp
)

### Generating Module File
_generate_module_lisp(roscpp
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/roscpp
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(roscpp_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(roscpp_generate_messages roscpp_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/msg/Logger.msg" NAME_WE)
add_dependencies(roscpp_generate_messages_lisp _roscpp_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/srv/Empty.srv" NAME_WE)
add_dependencies(roscpp_generate_messages_lisp _roscpp_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/srv/GetLoggers.srv" NAME_WE)
add_dependencies(roscpp_generate_messages_lisp _roscpp_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/srv/SetLoggerLevel.srv" NAME_WE)
add_dependencies(roscpp_generate_messages_lisp _roscpp_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(roscpp_genlisp)
add_dependencies(roscpp_genlisp roscpp_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS roscpp_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(roscpp
  "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/msg/Logger.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/roscpp
)

### Generating Services
_generate_srv_nodejs(roscpp
  "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/srv/Empty.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/roscpp
)
_generate_srv_nodejs(roscpp
  "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/srv/GetLoggers.srv"
  "${MSG_I_FLAGS}"
  "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/msg/Logger.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/roscpp
)
_generate_srv_nodejs(roscpp
  "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/srv/SetLoggerLevel.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/roscpp
)

### Generating Module File
_generate_module_nodejs(roscpp
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/roscpp
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(roscpp_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(roscpp_generate_messages roscpp_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/msg/Logger.msg" NAME_WE)
add_dependencies(roscpp_generate_messages_nodejs _roscpp_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/srv/Empty.srv" NAME_WE)
add_dependencies(roscpp_generate_messages_nodejs _roscpp_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/srv/GetLoggers.srv" NAME_WE)
add_dependencies(roscpp_generate_messages_nodejs _roscpp_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/clients/roscpp/srv/SetLoggerLevel.srv" NAME_WE)
add_dependencies(roscpp_generate_messages_nodejs _roscpp_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(roscpp_gennodejs)
add_dependencies(roscpp_gennodejs roscpp_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS roscpp_generate_messages_nodejs)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/roscpp)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/roscpp
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/roscpp)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/roscpp
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/roscpp)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/roscpp
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/roscpp)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/roscpp
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
