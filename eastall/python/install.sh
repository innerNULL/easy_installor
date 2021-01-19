# file: install.sh
# date: 2021-01-19


set -x

CURR_PATH=$(pwd)
TMP_PATH="./_tmp"
TARGET_VERSION="3.9.1"

mkdir -p ${TMP_PATH} && cd ${TMP_PATH}
wget https://www.python.org/ftp/python/${TARGET_VERSION}/Python-${TARGET_VERSION}.tgz
tar -zxvf Python-${TARGET_VERSION}.tgz
cd ./Python-${TARGET_VERSION} 
./configure --prefix=/usr/local/python3 --with-ssl
make -j4 && make install

rm -rf /usr/bin/python*

echo "" >> ~/.bashrc
echo "" >> ~/.bashrc
echo "# Python conf" >> ~/.bashrc
echo "alias python='/usr/local/python3/bin/python3'" >> ~/.bashrc
echo "alias pip='/usr/local/python3/bin/python3 -m pip'" >> ~/.bashrc
echo "PATH=${PATH}:/usr/local/python3/bin/" >> ~/.bashrc
echo "# Python conf end" >> ~/.bashrc

source ~/.bashrc

cd ${CURR_PATH} && rm -rf ${TMP_PATH}
