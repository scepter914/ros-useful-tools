#!/bin/bash

FILE_NAME=$@

TOPIC_FILTER=""

### Record topic with regular expressions ###
PERCEPTION_TOPIC=$(ros2 bag info $FILE_NAME | awk '{print $2}' | grep --regexp="/perception/*")

for TOPIC in ${PERCEPTION_TOPIC[@]}; do
  TOPIC_FILTER+=" "
  TOPIC_FILTER+=$TOPIC
  TOPIC_FILTER+=":=/original"
  TOPIC_FILTER+=$TOPIC
  TOPIC_FILTER+=" "
done

TOPIC_LIST=(
# /perception/object_recognition/detection/objects
# /perception/object_recognition/tracking/objects
# /perception/object_recognition/objects
)

for TOPIC in ${TOPIC_LIST[@]}; do
  TOPIC_FILTER+=" "
  TOPIC_FILTER+=$TOPIC
  TOPIC_FILTER+=":=/original"
  TOPIC_FILTER+=$TOPIC
  TOPIC_FILTER+=" "
done

echo $TOPIC_FILTER
ros2 bag play $FILE_NAME --clock 200 -s sqlite3 --remap $TOPIC_FILTER

