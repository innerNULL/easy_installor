# file: local_installation.sh
# date: 2022-07-23

# refer 'https://dev.mysql.com/doc/refman/8.0/en/binary-installation.html'


set -x


CURR_DIR=$(pwd)
INSTALLATION_DIR=~/bin

_WORKSPACE=${CURR_DIR}/_mysql_installation
_MYSQL_DIR=${_WORKSPACE}/mysql


function download() {
  python3 -c "import shutil; shutil.rmtree('${_WORKSPACE}')"   
  mkdir ${_WORKSPACE} && cd ${_WORKSPACE}
  wget https://downloads.mysql.com/archives/get/p/23/file/mysql-8.0.28-linux-glibc2.12-i686.tar.xz
  tar xvf ./*.tar.xz
  rm ./*.tar.xz
  mv ./mysql* ${_MYSQL_DIR}
  cd ${CURR_DIR}
}


function install() {
  cd ${_MYSQL_DIR}
  mkdir mysql-files
  chown mysql:mysql mysql-files
  chmod 750 mysql-files
  bin/mysqld --initialize --user=mysql
  bin/mysql_ssl_rsa_setup
  bin/mysqld_safe --user=mysql &
  # Optional 
  # cp support-files/mysql.server /etc/init.d/mysql.server
 
  cd ${CURR_DIR}           
  mkdir -p ${INSTALLATION_DIR} 
  mv ${_MYSQL_DIR} ${INSTALLATION_DIR} 
  rmdir ${_WORKSPACE}
  echo "Append 'export PATH=$PATH:${INSTALLATION_DIR}/bin' into your ~/.bashrc"
}


function config_user_group() {
  groupadd mysql
  useradd -r -g mysql -s /bin/false mysql
}


function main() {
  echo "Starting..."
  download
  config_user_group
  install
}


main
