#!/bin/bash

ALLTOPIC=""

### Record topic with regular expressions ###
PERCEPTION_TOPIC=$(ros2 topic list | grep --regexp="/perception/object_recognition/*")
ALLTOPIC="$ALLTOPIC $PERCEPTION_TOPIC"

### Record topic ###
RECORDTOPIC=(
/tf
/tf_static
)

for i in ${RECORDTOPIC[@]}; do
  ALLTOPIC="$ALLTOPIC $i"
done

### Record rosbag2 ###
ros2 bag record $ALLTOPIC -d 60
