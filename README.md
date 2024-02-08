# ros-useful-tools
## Python package

- [load_rosbag2_py (ROS2)](load_rosbag2_py/)

Python library loading rosbag2 topic data.
Maybe useful for offline anaysis from rosbag2 data.

- [nuscenes_rosbag (ROS2, ROS1)](nuscenes_rosbag/)

Make rosbag for nuScenes dataset.
It can be used for ROS1 and ROS2

## Shell script for ROS2

- [remap_rosbag2 (ROS2)](remap_rosbag2/)

Remove unnecessary topic by remapping when playing rosbag data.

- [record_rosbag2 (ROS2)](record_rosbag2/)

Record rosbag2 data with specified topic name.
This package can be used from 'ros2 launch'.

- [remake_rosbag2 (ROS2)](remake_rosbag2/)

Remake rosbag2 data to analyze and debug.

- [compress_rosbag2 (ROS2)](compress_rosbag2/)

Compress rosbag2 data to compressd zst files and put together for sharing.

- [down_ros2 (ROS2)](down_ros2/)

Down ROS2 process.

- [check_rosbag2 (ROS2)](check_rosbag2/)

Check to record rosbag2 data topic.

- [reindex_rosbag2 (ROS2)](reindex_rosbag2/)

Re-index each rosbag files.
This script make metadata.yaml, which became mandatory from ROS2 humble (ubuntu22).

## Shell script for ROS1

- [remap_rosbag (ROS1)](remap_rosbag/)

Remove unnecessary topic at rosbag playing.
