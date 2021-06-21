# Author: innerNULL
# Date: 2019-03-11


#FROM ubuntu:latest
#FROM ubuntu:18.04
FROM ubuntu:20.04

RUN mkdir /workspace && cd /workspace && \
    mkdir ./tmp && cd ./tmp
COPY ./scripts/build_env.sh /workspace/tmp
ARG DEBIAN_FRONTEND=noninteractive
RUN cd /workspace/tmp && bash ./build_env.sh

