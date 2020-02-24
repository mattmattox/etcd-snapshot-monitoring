FROM ubuntu:18.04

MAINTAINER matthew.mattox@rancher.com

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -yq --no-install-recommends \
    apt-utils \
    curl \
    bash \
    nginx \
    bc \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

EXPOSE 80

## Setup run script
WORKDIR /root
ADD etcd_snapshot_check.sh /root/run.sh
CMD /root/run.sh
