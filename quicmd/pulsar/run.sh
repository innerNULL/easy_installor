# file: run.sh
# date: 2021-04-08


set -x


VERSION="2.7.1"
FILENAME="apache-pulsar-${VERSION}"


get_pulsar_bin() {
    wget https://archive.apache.org/dist/pulsar/pulsar-${VERSION}/${FILENAME}-bin.tar.gz
    tar xvfz ${FILENAME}-bin.tar.gz
}


run_on_baremetal() {
    get_pulsar_bin
    cd ${FILENAME}
    ./bin/pulsar standalone --wipe-data
}

main() {
    run_on_baremetal
}


main
