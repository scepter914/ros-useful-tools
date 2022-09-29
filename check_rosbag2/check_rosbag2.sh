#!/bin/bash

FILE_NAME=$@
ros2 bag info $FILE_NAME | grep "camera"
ros2 bag info $FILE_NAME | grep "lidar"
ros2 bag info $FILE_NAME | grep "radar"

