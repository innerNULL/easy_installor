# Author: innerNULL
# Date: 2021-06-18


#FROM nvidia/cuda:10.0-base 
FROM nvidia/cuda:10.2-cudnn7-devel

RUN mkdir /workspace && cd /workspace && \
    mkdir ./tmp && cd ./tmp
COPY ./scripts/build_env.sh /workspace/tmp
ARG DEBIAN_FRONTEND=noninteractive
RUN cd /workspace/tmp && bash ./build_env.sh

