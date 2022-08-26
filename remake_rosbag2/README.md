
## remake_rosbag2

- This is a shell script to remove unnecessary topic at rosbag2 playing.

### Confirmed environment

- Ubuntu 20.04 LTS, ROS Galactic
- Ubuntu 22.04 LTS, ROS Humble

### Get started

- Set topic name for script file

```sh
### Make recording topic ###
# perception debug topic
ALLTOPIC=""
PERCEPTION_TOPIC=$(ros2 topic list | grep --regexp="/perception/object_recognition/*")
ALLTOPIC="$ALLTOPIC $PERCEPTION_TOPIC"

# other topic
RECORDTOPIC=(
/tf
/tf_static
/localization/kinematic_state
/sensing/lidar/concatenated/pointcloud
)
```

- input

```
- path_to_rosbag/
  - input_rosbag.db3: original rosbag2
```

- Run script

```sh
./remake_rosbag2.sh path_to_rosbag/input_rosbag.db3
```

- output

```
- path_to_rosbag/
  - input_rosbag.db3: original rosbag2
  - /visualize/{TIME}/
    - {TIME}.db3: rosbag for visualization
    - input_rosbag.txt: original rosbag2 file name
    - metadata.yaml
```
