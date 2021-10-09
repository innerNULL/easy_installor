# file: start_local.sh
# date: 2022-08-13


set -x


CURR_DIR=$(pwd)
SUPERSET_BIN=""
USER_NAME="superset"
PWD="superset"


function install_mac_deps() {
  echo ""
}


function install_superset() {
  python3 -m pip install --upgrade setuptools pip

  python3 -m pip uninstall -y markupsafe
  python3 -m pip install markupsafe==2.0.1
  python3 -m pip uninstall -y Werkzeug
  python3 -m pip install Werkzeug==2.0.3
  python3 -m pip install flask==2.1.0

  python3 -m pip install apache-superset

  python3 -m pip install duckdb-engine
}




function init_mac_superset() {
  SUPERSET_BIN=$(python3 -c 'import os, superset; print(os.path.dirname(superset.__file__))')/../../../../bin/superset

  export FLASK_APP=superset
  ${SUPERSET_BIN} db upgrade
  #${SUPERSET_BIN} fab create-admin
  ${SUPERSET_BIN} load_examples
  ${SUPERSET_BIN} init
}


function start_superset() {
  ${SUPERSET_BIN} run -p 8088 --with-threads --reload --debugger
}


function main() {
  export SUPERSET_CONFIG_PATH=${CURR_DIR}/superset_config.py
  install_superset
  init_mac_superset
  start_superset
}


main
