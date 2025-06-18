FROM osrf/ros:noetic-desktop-full

# Install dependencies
RUN apt-get update && apt-get install -y \
    ros-noetic-robot-localization \
    ros-noetic-pcl-ros \
    ros-noetic-cv-bridge \
    libeigen3-dev \
    libopencv-dev \
    libpcl-dev \
    && rm -rf /var/lib/apt/lists/*
