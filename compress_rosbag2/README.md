
## compress_rosbag2

Compress rosbag2 to zst files and put together for sharing.

### Confirmed environment

- Ubuntu 20.04 LTS, ROS2 Galactic

### Get started

- Command
  - Be careful for last / in directory path.

```sh
./scripts/compress_rosbag2.sh {thread} {directory path}
# example
# ./scripts/compress_rosbag2.sh 12 ~/Downloads/rosbag/

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
