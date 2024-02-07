FROM ros:noetic-ros-core

SHELL ["/bin/bash", "-c"] 

RUN apt-get update \
    && apt-get install -y \
    git python3-pip python3-tf2-ros ros-noetic-foxglove-msgs \
    && rm -rf /var/lib/apt/lists/*
RUN pip3 install numpy==1.21 python-dateutil==2.8.2 nuscenes-devkit opencv-python-headless seaborn rosbags
RUN pip3 install git+https://github.com/DanielPollithy/pypcd.git

WORKDIR /workspace
