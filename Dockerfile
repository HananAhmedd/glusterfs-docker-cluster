FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y software-properties-common wget curl gnupg && \
    add-apt-repository ppa:gluster/glusterfs-10 && \
    apt-get update && \
    apt-get install -y glusterfs-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /bricks/brick1

EXPOSE 24007 24008 49152-49251

CMD ["/usr/sbin/glusterd", "-N"]
