# 2020-09-18

set -x

CURR_PATH_=$(pwd)
GITHUB_PATH="opencv"

git clone https://github.com/opencv/opencv.git
cd ${GITHUB_PATH}
mkdir build && cd build
cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local ../
make -j7
make install

#rm -rf ${GITHUB_PATH}

