# file: install.sh
# date: 2021-01-17


set -x


TARGET_VERSION="3.19.3"
TARGET_URL=https://github.com/Kitware/CMake/releases/download/v${TARGET_VERSION}/cmake-${TARGET_VERSION}.tar.gz


wget ${TARGET_URL}

tar -zxvf cmake-${TARGET_VERSION}.tar.gz
cd cmake-${TARGET_VERSION}
./bootstrap #--prefix=/usr/local/cmake
make -j4
make install
