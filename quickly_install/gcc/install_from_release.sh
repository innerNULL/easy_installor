# file: install_from_release.sh
# date: 2023-07-25


CURR_DIR=$(pwd)
WORKSPACE_DIR="${CURR_DIR}/_quickly_install_gcc"
RELEASE_URI="wget http://ftp.gnu.org/gnu/gcc/gcc-13.1.0/gcc-13.1.0.tar.gz"
INSTALL_DIR="${HOME}/bin/gcc-13.1.0"


function init() {
  rm -rf ${WORKSPACE_DIR}
  mkdir -p ${WORKSPACE_DIR}
}


function download() {
  cd ${WORKSPACE_DIR}
  wget ${RELEASE_URI}
  tar -xvzf gcc-*.tar.gz
}


function install() {
  cd ${WORKSPACE_DIR}/gcc-*
  ./contrib/download_prerequisites
  mkdir build && cd build
  ../configure --prefix ${INSTALL_DIR} \
    --enable-threads=posix  \
    --enable-checking=release \
    --enable-languages=c,c++ \
    --disable-multilib
  make -j8 
  make install
}


function finalize() {
  cd ${CURR_DIR} && rm -rf ${WORKSPACE_DIR}
}


function main() {
  init
  download
  install
  finalize
}


main
