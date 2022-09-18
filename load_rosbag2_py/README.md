# rosbag2-loader-py

This repository is python library that loading rosbag2 topic data.
Useful for offline anaysis from rosbag2.

## Get started

- install rosbag2

```sh
sudo apt-get install ros-$ROS_DISTRO-ros2bag ros-$ROS_DISTRO-rosbag2*
```

- setup poetry

```sh
poetry update
```

- setup rosbag2-api

```sh
poetry shell
#(.venv)$
pip3 install rosbag2-api
exit
```

- run example

```sh
poetry run python3 -m rosbag2_loader.example --input {path_to_rosbag2}
```
