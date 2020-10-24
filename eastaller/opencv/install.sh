# 2020-09-18

set -x

CURR_PATH_=$(pwd)
GITHUB_PATH="opencv"
#QT_CMAKE_CONF="/usr/local/Cellar/qt/5.14.0/"
QT_CMAKE_CONF="/usr/local/Cellar/qt/5.12.0/"

git clone https://github.com/opencv/opencv.git
cd ${GITHUB_PATH}
mkdir build && cd build

#cmake \
#    -D CMAKE_BUILD_TYPE=Release \
#    -D CMAKE_INSTALL_PREFIX=${QT_CMAKE_CONF} \
#    -D WITH_QT=ON

cmake -D CMAKE_BUILD_TYPE=RELEASE \
-D CMAKE_INSTALL_PREFIX=/usr/local \
-D CMAKE_PREFIX_PATH=${QT_CMAKE_CONF} \
-D WITH_TBB=ON \
-D WITH_V4L=ON \
-D WITH_QT=ON \
-D WITH_GTK=ON \
-D WITH_OPENGL=ON \
-D WITH_VTK=ON \
-D OPENCV_GENERATE_PKGCONFIG=YES ..

make -j7
make install

rm -rf build

#rm -rf ${GITHUB_PATH}

