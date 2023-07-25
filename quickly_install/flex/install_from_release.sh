# file: install_from_release.sh
# date: 2023-07-25
#
# Symbolic link commands if you need:
# `ln -s ${HOME}/bin/flex-2.6.4/bin/flex ${HOME}/bin/flex`
# `ln -s ${HOME}/bin/flex-2.6.4/bin/flex++ ${HOME}/bin/flex++`


CURR_DIR=$(pwd)
WORKSPACE_DIR="${CURR_DIR}/_quickly_install_flex"
RELEASE_URI="https://github.com/westes/flex/files/981163/flex-2.6.4.tar.gz"
INSTALL_DIR="${HOME}/bin/flex-2.6.4"


function init() {
  rm -rf ${WORKSPACE_DIR}
  mkdir -p ${WORKSPACE_DIR}
}


function download() {
  cd ${WORKSPACE_DIR}
  wget ${RELEASE_URI}
  tar -xvzf flex-*.tar.gz
}


function install() {
  cd ${WORKSPACE_DIR}/flex-*
  ./configure --prefix ${INSTALL_DIR}
  make check 
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
