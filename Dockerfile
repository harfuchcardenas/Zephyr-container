# zephyr-base Dockerfile
FROM ubuntu:22.04

COPY /home/aharfuch/src/Zephyr-container/zephcont /app/zephcont
COPY /home/aharfuch/Kernergetiks/Projects/Humidity-control1/build-file /app/build-file
COPY /home/aharfuch/Kernergetiks/Projects/Humidity-control1/flash-file /app/flash-file

RUN apt-get update && \
    apt-get install -y python3 python3 python3-venv python3-pip git cmake ninja-build gperf \
    # ... add Zephyr dependencies ...
    && pip3 install west apt install vim

# Install Zephyr (example)
RUN west init zephyrproject && \
    cd zephyrproject && \
    west update && \
    west zephyr-export


# Set up environment variables (if needed)
ENV ZEPHYR_BASE=/zephyrproject/zephyr
