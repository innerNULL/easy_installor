# Author: innerNULL
# Date: 2021-06-18


#FROM nvidia/cuda:10.0-base 
#FROM nvidia/cuda:10.2-cudnn7-devel
#FROM nvidia/cuda:10.0-cudnn7-devel
FROM nvidia/driver:460.73.01-ubuntu20.04

RUN mkdir /workspace && cd /workspace && \
    mkdir ./tmp && cd ./tmp
COPY ./scripts/build_env.sh /workspace/tmp
RUN cd /workspace/tmp && bash ./build_env.sh

