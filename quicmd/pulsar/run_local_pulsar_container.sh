# file: run_local_pulsar_container.sh


set -x

PULSAR_VERSION="2.7.0"
PULSAR_PORT="6650"


run_pulsar_in_docler_locally() {
	docker run \
	  -p ${PULSAR_PORT}:${PULSAR_PORT} \
	  -p 8080:8080 \
	  --mount source=pulsardata,target=/pulsar/data \
	  --mount source=pulsarconf,target=/pulsar/conf \
	  apachepulsar/pulsar:${PULSAR_VERSION} \
	  bin/pulsar standalone --wipe-data
}


run_pulsar_in_docler_locally
