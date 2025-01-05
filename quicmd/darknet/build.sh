# -*- coding: utf-8 -*-
# file: build.sh
# date: 2025-01-04


set -x


CURR_DIR=$(pwd)
WORKWPACE_DIR="${CURR_DIR}/_workspace"

CMAKE="${HOME}/bin/cmake-3.27.4/bin/cmake"
CMAKE_CUDA_COMPILER="/usr/local/cuda-12.4/bin/nvcc"
CUDA_TOOLKIT_ROOT_DIR="/usr/local/cuda-12.4/"
ENABLE_CUDA="ON"
OPENCV_SRC="https://github.com/opencv/opencv/archive/refs/tags/4.1.1.zip"
BUILD_THREADS=16
CMAKE_VERBOSE_MAKEFILE="OFF"

_CMAKE_OpenCV_DIR=${WORKWPACE_DIR}/src/opencv/build/install


function build_opencv() {
  cd ${CURR_DIR}
  cd ${WORKWPACE_DIR}/src
  wget ${OPENCV_SRC}
  unzip *.zip
  rm *.zip
  mv opencv-* opencv
  cd opencv
  mkdir build
  cd build
  ${CMAKE} \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_EXAMPLES=OFF \
    -DCMAKE_INSTALL_PREFIX=${_CMAKE_OpenCV_DIR} \
    -DBUILD_TESTS=OFF \
    -DBUILD_PERF_TESTS=OFF \
    -DBUILD_EXAMPLES=OFF \
    -DCMAKE_VERBOSE_MAKEFILE=${CMAKE_VERBOSE_MAKEFILE} \
    ../
  make -j ${BUILD_THREADS} 
  make install
}


function build_darknet() {
  cd ${CURR_DIR}
  cd ${WORKWPACE_DIR}/src
  wget https://github.com/AlexeyAB/darknet/archive/refs/heads/master.zip
  unzip *.zip
  mv darknet-* darknet
  rm *.zip
  rm *-*
  cd darknet
  #mkdir build
  #cd build
  ${CMAKE} \
    -DENABLE_CUDA=${ENABLE_CUDA} \
    -DOpenCV_DIR=${_CMAKE_OpenCV_DIR}/.. \
    -DCUDA_TOOLKIT_ROOT_DIR=${CUDA_TOOLKIT_ROOT_DIR} \
    -DCMAKE_CUDA_COMPILER=${CMAKE_CUDA_COMPILER} \
    -DCMAKE_VERBOSE_MAKEFILE=${CMAKE_VERBOSE_MAKEFILE} \
    ./
  make -j ${BUILD_THREADS} #VERBOSE=1
}


function init() {
  mkdir -p ${WORKWPACE_DIR}
  mkdir -p ${WORKWPACE_DIR}/src
  if [ -f "${CMAKE_CUDA_COMPILER}" ]; then
    echo "File ${CMAKE_CUDA_COMPILER} exists."
  else
    echo "No 'nvcc' found, consider 'sudo apt install nvidia-cuda-toolkit'"
  fi
}


function main() {
  init
  build_opencv
  build_darknet
}


main
