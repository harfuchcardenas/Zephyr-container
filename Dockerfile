# zephyr-base Dockerfile
FROM ubuntu:22.04

# Avoid interactive prompts during build
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y python3 python3-venv python3-pip git cmake ninja-build gperf curl 
RUN pip3 install west apt
RUN exit 0;

# Install Zephyr (example)
#RUN python3 -m venv ~/zephyrproject/.venv && west init zephyrproject && \
#    cd zephyrproject && \
#    west update && \
#    west zephyr-export


COPY zephcont ~/zephcont
COPY build-file ~/build-file
COPY flash-file ~/flash-file


# Set up environment variables (if needed)
ENV ZEPHYR_BASE=~/zephyrproject/zephyr
