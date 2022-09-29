# reindex_rosbag2

Reindex each rosbag files.
This script make metadata.yaml, which became mandatory from ROS2 humble (ubuntu22), 

## Confirmed environment

- Ubuntu 22.04 LTS, ROS2 Humble

## Get started

```sh
./reindex_rosbag2/reindex_rosbag2.sh {directory path}
```

- input

```
.
├── rosbag
│  ├── rosbag2_2022_01_09-13_49_29_0.db3
│  ├── rosbag2_2022_02_05-00_54_33_0.db3
```

- output

```
.
├── rosbag
│  ├── rosbag2_2022_01_09-13_49_29_0
│  │  ├── metadata.yaml
│  │  └── rosbag2_2022_01_09-13_49_29_0.db3
│  ├── rosbag2_2022_02_05-00_54_33_0
│  │  ├── metadata.yaml
│  │  └── rosbag2_2022_02_05-00_54_33_0.db3
```
