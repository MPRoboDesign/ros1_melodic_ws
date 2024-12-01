#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/tools/rostopic"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/madhav/Documents/ros1_melodic_ws/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/madhav/Documents/ros1_melodic_ws/install/lib/python3/dist-packages:/home/madhav/Documents/ros1_melodic_ws/build/rostopic/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/madhav/Documents/ros1_melodic_ws/build/rostopic" \
    "/usr/bin/python3" \
    "/home/madhav/Documents/ros1_melodic_ws/src/ros_comm/tools/rostopic/setup.py" \
     \
    build --build-base "/home/madhav/Documents/ros1_melodic_ws/build/rostopic" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/madhav/Documents/ros1_melodic_ws/install" --install-scripts="/home/madhav/Documents/ros1_melodic_ws/install/bin"
