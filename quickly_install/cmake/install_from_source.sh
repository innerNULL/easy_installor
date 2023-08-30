# file: install_from_source.sh
# date: 2021-01-17


set -x


CURR_DIR=$(pwd)
WORKSPACE_DIR="${CURR_DIR}/_quickly_install_cmake"
VERSION="3.27.4"
RELEASE_URI="https://github.com/Kitware/CMake/releases/download/v${VERSION}/cmake-${VERSION}.tar.gz"
INSTALL_DIR="${HOME}/bin/cmake-${VERSION}"
CC="/usr/bin/gcc"
CXX="/usr/bin/g++"


function init() {
  rm -rf ${WORKSPACE_DIR}
  mkdir -p ${WORKSPACE_DIR}
}


function download() {
  cd ${WORKSPACE_DIR}
  wget ${RELEASE_URI}
  tar -xvzf cmake-${VERSION}.tar.gz
  rm cmake-${VERSION}.tar.gz
  cd ${CURR_DIR}
}


function install() {
  cd ${WORKSPACE_DIR}/cmake-${VERSION}
  ./bootstrap --prefix=${INSTALL_DIR}
  make -j8 
  make install
  cd ${CURR_DIR}
}


function finalize() {
  cd ${CURR_DIR} && rm -rf ${WORKSPACE_DIR}
  echo "###################### Finished Installation ######################"
  echo "Apend following command in you '.bashrc'"
  echo "export PATH=${INSTALL_DIR}/bin:\$PATH"
  echo "alias cmake=${INSTALL_DIR}/bin/cmake"
}


function main() {
  init
  download
  install
  finalize
}


main
