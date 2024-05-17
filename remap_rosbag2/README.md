# remap_rosbag2

- This is a shell script to remove unnecessary topic at rosbag2 playing.

## Confirmed environment

- Ubuntu 20.04 LTS, ROS Galactic
- Ubuntu 22.04 LTS, ROS Humble

## Get Started

- 1. Write Unnecessary topic in TOPIC_LIST

```sh
# Record topic with regular expressions
PERCEPTION_TOPIC=$(ros2 bag info $FILE_NAME | awk '{print $2}' | grep --regexp="/perception/*")

# topic list
TOPIC_LIST=(
/perception/object_recognition/detection/objects
/perception/object_recognition/tracking/objects
/perception/object_recognition/objects
)
```

- 2. Add execution permission

```sh
chmod a+x remap_rosbag2.sh
```

- 3. Execute script

```sh
./remap_rosbag2.sh file.db3
```
