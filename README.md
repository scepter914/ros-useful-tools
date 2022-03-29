# ros2-useful-scripts

## Supported Feature

- [x] rosbag2 selected topics record
- [x] rosbag2 compression

### scripts/rogbag2_record.sh

Record rosbag2 with choosed topics.

- Change topics to record

```
RECORDTOPIC=(
/parameter_events
/robot_description
/rosout
/tf
/tf_static
)
```

- Command

```sh
./scripts/rogbag2_record.sh
```

## scripts/rosbag2_compress.sh

Compress rosbag2 and put together for uploads.

- Command
  - Be careful for last / in directory path.

```sh
./scripts/rosbag2_compress.sh {thread} {directory path}
# example
# ./scripts/rosbag2_compress.sh 12 ~/Downloads/rosbag/

```

- input

```
.
├── rosbag
│  ├── rosbag2_2022_01_09-13_49_29
│  │  ├── metadata.yaml
│  │  └── rosbag2_2022_01_09-13_49_29_0.db3
│  ├── rosbag2_2022_02_05-00_54_33
│  │  ├── metadata.yaml
│  │  └── rosbag2_2022_02_05-00_54_33_0.db3
```

- output

```

├── rosbag
│  ├── rosbag2_2022_01_09-13_49_29
│  │  ├── metadata.yaml
│  │  └── rosbag2_2022_01_09-13_49_29_0.db3
│  ├── rosbag2_2022_02_05-00_54_33
│  │  ├── metadata.yaml
│  │  └── rosbag2_2022_02_05-00_54_33_0.db3
│  └── zst
│     ├── rosbag2_2022_01_09-13_49_29_0.db3.zst
│     └── rosbag2_2022_02_05-00_54_33_0.db3.zst
```

