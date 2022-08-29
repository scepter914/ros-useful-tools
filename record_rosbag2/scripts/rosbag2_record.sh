#!/bin/bash

RECORDTOPIC=(
/parameter_events
/robot_description
/rosout
/tf
/tf_static
)

ALLTOPIC=""

for i in ${RECORDTOPIC[@]}; do
  ALLTOPIC="$ALLTOPIC $i"
done

ros2 bag record $ALLTOPIC -d 60
