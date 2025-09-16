FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=interactive

RUN apt-get update && apt-get install -y \
    perl \
    unzip \
    git \
    vim \
    openssh-client

RUN apt install -y \
    cmake \
    ninja-build \
    gperf \
    ccache \
    dfu-util \
    device-tree-compiler \
    wget \
    python3-dev \
    python3-venv \
    python3-tk \
    xz-utils file make gcc gcc-multilib g++-multilib libsdl2-dev libmagic1

RUN cmake --version && python3 --version && dtc --version || (echo "❌ Command failed. Exiting..." && exit 1)

WORKDIR /app

COPY zephyr_build/build-file .

RUN chmod +x build-file
