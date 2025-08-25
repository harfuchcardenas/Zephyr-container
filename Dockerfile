FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=interactive

RUN apt-get update && apt-get install -y \
    perl \
    git \
    openssh-client

WORKDIR /app

COPY zephcont .

RUN chmod +x zephcont

CMD ["./zephcont"]

