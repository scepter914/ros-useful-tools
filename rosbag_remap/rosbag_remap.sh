#!/bin/bash

FILE_NAME=$@

TOPIC_LIST=(
/tf
/tf_static
/perception/object_recognition/objects
/perception/object_recognition/tracking/objects
/perception/object_recognition/detection/objects
/localization/twist
)

TOPIC_FILTER=""
for TOPIC in ${TOPIC_LIST[@]}; do
  TOPIC_FILTER+=$TOPIC
  TOPIC_FILTER+=":=/tmp"
  TOPIC_FILTER+=$TOPIC
  TOPIC_FILTER+=" "
done
rosbag play $FILE_NAME --clock $TOPIC_FILTER

