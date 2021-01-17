# Date: 2020-11-29


set -x


CURR_PATH=$(pwd)
TMP_PATH="${CURR_PATH}/tmp"




function preprocess() {
    mkdir -p ${TMP_PATH} && cd ${TMP_PATH}
    git clone https://github.com/milvus-io/milvus.git
}


function install_cpp_client_sdk() {
    cd ${TMP_PATH}/milvus/sdk
    bash build.sh
}


function main() {
    preprocess
    install_cpp_client_sdk
}


main
