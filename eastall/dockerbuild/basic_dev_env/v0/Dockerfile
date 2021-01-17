# Author: innerNULL
# Date: 2019-03-11


#FROM ubuntu:latest
FROM ubuntu:16.04

RUN mkdir /workspace && cd /workspace && \
    mkdir ./tmp && cd ./tmp
COPY ./build_env.sh /workspace/tmp
RUN cd /workspace/tmp && bash ./build_env.sh

