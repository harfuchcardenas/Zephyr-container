# zephyr-base Dockerfile
FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y python3-pip git cmake ninja-build gperf \
    # ... add Zephyr dependencies ...
    && pip3 install west

# Install Zephyr (example)
RUN west init zephyrproject && \
    cd zephyrproject && \
    west update && \
    west zephyr-export

# Set up environment variables (if needed)
ENV ZEPHYR_BASE=/zephyrproject/zephyr
