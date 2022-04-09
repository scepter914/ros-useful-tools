# rosbag2-recorder-launcher

Launcher for rosbag2 record

## How to launch
### rosbag2_recorder_launch.launch

If you choose topics to record, you should use `rosbag2_recorder_launch.launch.py`.

1. Set your record topic

Example is [here](/config/topic_list.txt)

2. launch

```
ros2 launch rosbag2_recorder_launcher rosbag2_recorder_launch.launch.py
```

### rosbag2_recorder_launch.launch

If you record all topic, you should use `rosbag2_all_topic_recorder_launch.launch.py`.

```
ros2 launch rosbag2_recorder_launcher rosbag2_all_topic_recorder_launch.launch.py
```

## history
