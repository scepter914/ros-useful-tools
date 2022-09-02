#!/bin/bash

FILE_NAME=$@

TOPIC_FILTER=""

### Record topic with regular expressions ###
PERCEPTION_TOPIC=$(ros2 topic list | grep --regexp="/perception/object_recognition/*")
TOPIC_FILTER="$TOPIC_FILTER $PERCEPTION_TOPIC"

TOPIC_LIST=(
/perception/object_recognition/detection/objects
/perception/object_recognition/tracking/objects
/perception/object_recognition/objects
)

for TOPIC in ${TOPIC_LIST[@]}; do
  TOPIC_FILTER+=" "
  TOPIC_FILTER+=$TOPIC
  TOPIC_FILTER+=":=/original"
  TOPIC_FILTER+=$TOPIC
  TOPIC_FILTER+=" "
done

ros2 bag play $FILE_NAME --clock 200 -s sqlite3 --remap $TOPIC_FILTER
