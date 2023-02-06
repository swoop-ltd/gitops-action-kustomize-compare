FROM ubuntu:20.04

RUN apt-get -y update && \
    apt-get -y install wget curl git

ADD ./files  /
ENTRYPOINT ["/entrypoint.sh"]
