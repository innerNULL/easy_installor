# 2020-09-18

set -x

CURR_PATH_=$(pwd)
GITHUB_PATH="opencv"
QT_CMAKE_CONF="/usr/local/Cellar/qt/5.14.0/"

#git clone https://github.com/opencv/opencv.git
cd ${GITHUB_PATH}
mkdir build && cd build
cmake \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=${QT_CMAKE_CONF} \
    -D WITH_QT=ON
make -j7
make install

rm -rf build

#rm -rf ${GITHUB_PATH}

