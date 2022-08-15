
## rosbag_remap

- This is a shell script to remove unnecessary topic at rosbag playing.
- Japanese blog <https://scepter914.github.io/blog/2021/20210804_rosbag_remap/>

### Confirmed environment

- Ubuntu 20.04 LTS, ROS Noetic

### Get Started

- 1. Write Unnecessary topic in TOPIC_LIST

```
TOPIC_LIST=(
/tf
/tf_static
/perception/object_recognition/objects
/perception/object_recognition/tracking/objects
/perception/object_recognition/detection/objects
/localization/twist
)
```

- 2. Add execution permission

```sh
chmod a+x rosbag_remap.sh
```

- 3. Execute script

```sh
./rosbag_remap.sh file.bag
# If you want to use option
./rosbag_remap.sh file.bag -r 0.5
```

