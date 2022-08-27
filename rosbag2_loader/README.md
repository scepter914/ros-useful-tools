# rosbag2-loader-py

This repository is python library that loading rosbag2 topic data.
Useful for offline anaysis from rosbag2.

## Get started

- install rosbag2

```
sudo apt-get install ros-$ROS_DISTRO-ros2bag ros-$ROS_DISTRO-rosbag2*
```

- setup poetry

```
poetry update
```

- setup rosbag2-api

```
pip3 install rosbag2-api
exit
```

- run example

```
poetry run python3 -m rosbag2_loader.example --input {path_to_rosbag2}
```
