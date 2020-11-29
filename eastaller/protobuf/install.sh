

# Date: 2020-11-27


set -x


CURR_PATH=$(pwd)
TMP_ROOT="./tmp"
INSTALL_LOCATION="/usr"
TARGT_VERSION="3.14.0"
PB_CODE_PKG="protobuf-cpp-${TARGT_VERSION}"
PB_CODE_ROOT="${TMP_ROOT}/${PB_CODE_PKG}"


function mac_installer() {
    brew install autoconf automake libtool shtool gflags
    ln -s /usr/local/bin/glibtoolize /usr/local/bin/libtoolize

    mkdir -p ${TMP_ROOT} && cd ${TMP_ROOT}
    wget https://github.com/protocolbuffers/protobuf/releases/download/v${TARGT_VERSION}/${PB_CODE_PKG}.tar.gz
    tar -zxvf ${PB_CODE_PKG}.tar.gz
    cd ${CURR_PATH}

    cd ${PB_CODE_ROOT}
    #git submodule update --init --recursive

    make clean

    sh ./autogen.sh
    ./configure --prefix=${INSTALL_LOCATION}
    make -j8
    make check
    sudo make install
    #ldconfig # refresh shared library cache.
}


function main() {
    mac_installer
}


main
