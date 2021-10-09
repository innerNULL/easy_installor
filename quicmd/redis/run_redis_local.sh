# run_redis_local.sh
# date: 2021-12-27


set -x


WORKSPACE="_redis_workspace"
_GIT_URL="https://ghproxy.com/https://github.com/redis/redis.git"


function init() {
  mkdir -p ${WORKSPACE}
  WORKSPACE=$(cd ${WORKSPACE} && pwd)
}


function build() {
  cd ${WORKSPACE} && git clone ${_GIT_URL} 
  cd redis && make -j8
}


function get_bin() {
  CREAT_CLUSTER="${WORKSPACE}/redis/utils/create-cluster/create-cluster"
}


function main() {
  init
  build
  get_bin
  ${CREAT_CLUSTER} start && ${CREAT_CLUSTER} create
}


main
