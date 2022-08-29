# rosbag2-record-launcher

Launcher for rosbag2 record with choosed topics.

- Environment: Ubuntu 20.04 LTS, ROS2 Galactic

## Use as shell script

1. Change record topic in [here](/scripts/rogbag2_record.sh).

```
RECORDTOPIC=(
/parameter_events
/robot_description
/rosout
/tf
/tf_static
)
```

2. Add authority

```
chmod a+x ./scripts/rogbag2_record.sh
```

3. Run

```
./scripts/rogbag2_record.sh
```

## Use as ros2 launch

### rosbag2_script_record_launch.launch

1. Set your record topic

Example is [here](/scripts/rogbag2_record.sh)

2. launch

```
ros2 launch rosbag2_record_launcher rosbag2_script_record_launch.launch.py
```

or

```
ros2 launch rosbag2_record_launcher rosbag2_script_record_launch.launch.xml
```

### rosbag2_config_record_launch.launch.py

If you choose topics to record, you can use also `rosbag2_record_launch.launch.py`.

1. Set your record topic

Example is [here](/config/topic_list.txt)

2. launch

```
ros2 launch rosbag2_record_launcher rosbag2_record_launch.launch.py
```

### rosbag2_all_topic_record_launch.launch.xml

If you record all topic, you should use `rosbag2_all_topic_record_launch.launch.py`.

```
ros2 launch rosbag2_record_launcher rosbag2_all_topic_record_launch.launch.py
```

## history

- 2022/04/09 ver 0.0.1 publish this repository
