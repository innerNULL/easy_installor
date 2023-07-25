# file: install_from_release.sh
# date: 2023-07-25
#
# After installation, may need manually execute symbolic link commant, 
# such like `ln -s ${HOME}/bin/m4-1.4.10/bin/m4 ${HOME}/bin/m4`


CURR_DIR=$(pwd)
WORKSPACE_DIR="${CURR_DIR}/_quick_install_m4"
RELEASE_URI="ftp://ftp.gnu.org/gnu/m4/m4-1.4.10.tar.gz"
INSTALL_DIR="${HOME}/bin/m4-1.4.10"


function init() {
  rm -rf ${WORKSPACE_DIR}
  mkdir -p ${WORKSPACE_DIR}
}


function download() {
  cd ${WORKSPACE_DIR}
  wget ${RELEASE_URI}
  tar -xvzf m4-*.tar.gz
}


function install() {
  cd ${WORKSPACE_DIR}
  cd m4-*
  ./configure --prefix=${INSTALL_DIR}
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
