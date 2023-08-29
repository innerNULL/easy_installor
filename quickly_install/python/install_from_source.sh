# file: install_from_source.sh
# date: 2021-01-19


set -x


CURR_DIR=$(pwd)
WORKSPACE_DIR="${CURR_DIR}/_quickly_install_python"
PYTHON_VERSION=3.8.1
PYTHON_MAJOR=3
INSTALL_DIR="${HOME}/bin/python-${PYTHON_VERSION}"


function init() {
  rm -rf ${WORKSPACE_DIR}
  mkdir -p ${WORKSPACE_DIR}
}


function download() {
  cd ${WORKSPACE_DIR}
  wget https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz
  tar -xvzf Python-*.tgz
  rm Python-*.tgz
  cd ${CURR_DIR}
}


function install() {
  cd ${WORKSPACE_DIR}/Python*
  ./configure \
    --prefix=${INSTALL_DIR} \
    --enable-shared \
    --enable-optimizations \
    --enable-ipv6 \
    --enable-loadable-sqlite-extensions \
    --with-ssl
  make -j8 && make install
}


function finalize() {
  cd ${CURR_DIR} && rm -rf ${WORKSPACE_DIR}
  echo "Apend following command in you '.bashrc'"
  echo "export LD_LIBRARY_PATH=${INSTALL_DIR}/lib:\$LD_LIBRARY_PATH"
}


function main() {
  init
  download
  install
  finalize
}


main
