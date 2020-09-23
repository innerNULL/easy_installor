# 2020-09-18

set -x

CURR_PATH_=$(pwd)
GITHUB_URL="https://github.com/sogou/workflow.git"
GITHUB_PATH="workflow"


git clone ${GITHUB_URL}
cd ${GITHUB_PATH}
mkdir build && cd build

export OPENSSL_ROOT_DIR=/usr/local/opt/openssl
cmake ../
#cmake -DOPENSSL_ROOT_DIR=/usr/local/opt/openssl@1.1/include -DOPENSSL_LIBRARIES=/usr/local/opt/openssl@1.1/lib ../

make -j7
make install

rm -rf build

#rm -rf ${GITHUB_PATH}

