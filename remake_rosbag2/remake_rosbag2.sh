
#!/bin/bash

### Setting output directory ###

# OUTPUT_ROOT_DIR="$HOME/Downloads/"
OUTPUT_ROOT_DIR=$(dirname $1)"/"
VISUALIZE_DIR=$OUTPUT_ROOT_DIR"visualization/"
OUTPUT_NAME=$(date +%Y%m%d-%H%M%S)

# Make path names
ROSBAG_NAME=$(basename $1)
ROSBAG_NAME_WITHOUT_EXT=${ROSBAG_NAME%.*}".txt"
ROSBAG_PATH=$VISUALIZE_DIR$OUTPUT_NAME

# TOUCH from original rosbag name
TOUCH_PATH=$ROSBAG_PATH"/"$ROSBAG_NAME_WITHOUT_EXT


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

for i in ${RECORDTOPIC[@]}; do
  ALLTOPIC="$ALLTOPIC $i"
done

### Record rosbag2 ###
echo $ALLTOPIC
ros2 bag record $ALLTOPIC -o $ROSBAG_PATH

### Run touch command to log original rosbag path ###
touch $TOUCH_PATH
