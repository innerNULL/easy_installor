# file: run_milvus_docker.sh
# date: 2021-12-27


set -x


VERSION="v1.1.1"
WORKSPACE="./_milvus_worksapce"
IMAGE="milvusdb/milvus:1.1.1-cpu-d061621-330cc6"


function init() {
  mkdir -p ${WORKSPACE}
  WORKSPACE=$(cd ${WORKSPACE} && pwd)
}


function get_image() {
  sudo docker pull ${IMAGE}
}


function get_configs() {
  mkdir -p ${WORKSPACE}/conf
  cd ${WORKSPACE}/conf 
  wget https://raw.githubusercontent.com/milvus-io/milvus/${VERSION}/core/conf/demo/server_config.yaml
}


function run_milvus_v1() {
  sudo docker run -d --name milvus_cpu_1.1.1 \
    -p 19530:19530 \
    -p 19121:19121 \
    -v ${WORKSPACE}/db:/var/lib/milvus/db \
    -v ${WORKSPACE}/conf:/var/lib/milvus/conf \
    -v ${WORKSPACE}/logs:/var/lib/milvus/logs \
    -v ${WORKSPACE}/wal:/var/lib/milvus/wal \
    ${IMAGE}
}


function main() {
  init
  get_image
  get_configs
  run_milvus_v1
}


main
