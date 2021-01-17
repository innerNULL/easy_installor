
# file: install_dev.sh
# date: 2020-12-08


set -x


CURR_PATH=$(pwd)
TMP_ROOT="./tmp"
INSTALL_LOCATION="/usr"
TARGT_VERSION="3.14.0"
PB_CODE_PKG="protobuf-cpp-${TARGT_VERSION}"
PB_CODE_ROOT="${TMP_ROOT}/${PB_CODE_PKG}"


function installer() {
    git clone https://github.com/grpc/grpc.git
    cd grpc
    git submodule update --init
    mkdir cmake_build && cd cmake_build
    cmake ../
    make -j7
    sudo make install
}


function main() {
    installer
}


main
