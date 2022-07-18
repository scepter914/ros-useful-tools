# ros-useful-tools

## Supported Feature

- [x] rosbag remap
- [x] rosbag2 compression

## scripts/rosbag2_compress.sh

Compress rosbag2 and put together for uploads.

### Environment

- Ubuntu 20.04 LTS, ROS2 Galactic

### Get started


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

## rosbag remap script

- This is a shell script to remove unnecessary topic at rosbag playing.
- Japanese blog <https://scepter914.github.io/blog/2021/20210804_rosbag_remap/>

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

