## install turtlebot3-gazebo
```
$ sudo apt install ros-noetic-turtlebot3-gazebo
$ sudo apt install ros-noetic-turtlebot3-teleop
$ sudo apt install ros-noetic-gmapping
$ sudo apt install ros-noetic-map-server
$ sudo apt install ros-noetic-hector-mapping
$ sudo apt install ros-noetic-iris-lama-ros
```

## run in every terminal
```
$ . /opt/ros/noetic/setup.bash && export TURTLEBOT3_MODEL=waffle_pi
```

## run in different terminals
```
$ roslaunch turtlebot3_gazebo turtlebot3_world.launch
$ rosrun robot_state_publisher robot_state_publisher
$ roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch
$ rosrun gmapping slam_gmapping
$ rviz
```

## save the map
```
$ rosrun map_server map_saver -f mapname
``` 

### another mapping method
```
$ rosrun hector_mapping hector_mapping
$ rosrun iris_lama_ros slam2d_ros
```
