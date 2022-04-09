# rosbag2-recorder-launcher

Launch software for rosbag2 record.

## Use as shell script

1. Set your record topic

Example is [here](/scripts/rogbag2_record.sh)

## Use as ros2 launch

### rosbag2_script_recorder_launch.launch

1. Set your record topic

Example is [here](/scripts/rogbag2_record.sh)

2. launch

```
ros2 launch rosbag2_recorder_launcher rosbag2_script_recorder_launch.launch
```

### rosbag2_config_recorder_launch.launch

If you choose topics to record, you can use also `rosbag2_recorder_launch.launch.py`.

1. Set your record topic

Example is [here](/config/topic_list.txt)

2. launch

```
ros2 launch rosbag2_recorder_launcher rosbag2_recorder_launch.launch.py
```

### rosbag2_all_topic_recorder_launch.launch

If you record all topic, you should use `rosbag2_all_topic_recorder_launch.launch.py`.

```
ros2 launch rosbag2_recorder_launcher rosbag2_all_topic_recorder_launch.launch.py
```

## history
