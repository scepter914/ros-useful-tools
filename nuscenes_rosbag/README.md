# nuscenes_rosbag

The scripts to make nuScenes rosbag.

## Get started

- Download dataset
  - v1.0-mini.tgz
  - can_bus.zip
  - nuScenes-map-expansion-v1.3.zip
- Set nuScenes dataset

```

├── data
│  ├── can_bus
│  │  ├── scene-0001_meta.json
│  │  ├── ...
│  ├── maps
│  │  ├── 36092f0b03a857c6a3403e25b4b7aab3.png
│  │  ├── 37819e65e09e5547b8a3ceaefba56bb2.png
│  │  ├── 53992ee3023e5494b90c316c183be829.png
│  │  ├── 93406b464a165eaba6d9de76ca09f5da.png
│  │  ├── basemap
│  │  ├── expansion
│  │  └── prediction
│  ├── samples
│  │  ├── CAM_BACK
│  │  ├── CAM_BACK_LEFT
│  │  ├── CAM_BACK_RIGHT
│  │  ├── CAM_FRONT
│  │  ├── CAM_FRONT_LEFT
│  │  ├── CAM_FRONT_RIGHT
│  │  ├── LIDAR_TOP
│  │  ├── RADAR_BACK_LEFT
│  │  ├── RADAR_BACK_RIGHT
│  │  ├── RADAR_FRONT
│  │  ├── RADAR_FRONT_LEFT
│  │  └── RADAR_FRONT_RIGHT
│  ├── sweeps
│  │  ├── CAM_BACK
│  │  ├── CAM_BACK_LEFT
│  │  ├── CAM_BACK_RIGHT
│  │  ├── CAM_FRONT
│  │  ├── CAM_FRONT_LEFT
│  │  ├── CAM_FRONT_RIGHT
│  │  ├── LIDAR_TOP
│  │  ├── RADAR_BACK_LEFT
│  │  ├── RADAR_BACK_RIGHT
│  │  ├── RADAR_FRONT
│  │  ├── RADAR_FRONT_LEFT
│  │  └── RADAR_FRONT_RIGHT
│  └── v1.0-mini
│     ├── attribute.json
│     ├── calibrated_sensor.json
│     ├── category.json
│     ├── ego_pose.json
│     ├── instance.json
│     ├── log.json
│     ├── map.json
│     ├── sample.json
│     ├── sample_annotation.json
│     ├── sample_data.json
│     ├── scene.json
│     ├── sensor.json
│     └── visibility.json
```

- Docker build

```
docker build -t nuscenes_rosbag .
```

- Run docker

```
docker run -it --rm -v $PWD:/workspace nuscenes_rosbag:latest 
```

- Run python to make rosbag for ROS1


```
python3 scripts/main.py
```

- Run command to make rosbag for ROS2

```
find $1 -name '*.bag' | xargs -n1 rosbags-convert {}
```

## Reference

- [nuscenes2bag](https://github.com/foxglove/nuscenes2bag)

