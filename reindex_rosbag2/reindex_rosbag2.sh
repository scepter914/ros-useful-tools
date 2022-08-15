#!/bin/bash

ROSBAG_PATHS=$(find $1 -name '*.db3')

for ROSBAG_PATH in ${ROSBAG_PATHS[@]}; do
  ROSBAG_NAME=$(basename $ROSBAG_PATH)
  ROSBAG_NEW_DIR=${ROSBAG_PATH%.*}
  mkdir -p $ROSBAG_NEW_DIR
  mv $ROSBAG_PATH $ROSBAG_NEW_DIR
  ros2 bag reindex $ROSBAG_NEW_DIR sqlite3
done

