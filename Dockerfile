FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=interactive

RUN mkdir -p /app

RUN apt-get update && apt-get install -y \
    xz-utils

RUN apt update && apt install -y \
    zip \
    perl-base \
    vim \
    nano \
    openssh-client \
    curl \
    git \
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
    file \
    make \
    gcc \
    gcc-multilib \
    g++-multilib \
    libsdl2-dev \
    libmagic1

RUN curl -o /app/build-file https://raw.githubusercontent.com/harfuchcardenas/zephyr_build/master/build-file

RUN cmake --version && python3 --version && dtc --version || (echo "❌ Command failed. Exiting..." && exit 1)

WORKDIR /app


RUN chmod +x build-file
