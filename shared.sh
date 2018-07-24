cd $(dirname $0)

IMAGE_TAG=${IMAGE_TAG:-asterisk-ci:f28}
VOLUME_NAME=${VOLUME_NAME:-asterisk-ci-test}
DOCKER_ARGS="--rm --volume /etc/localtime:/etc/localtime:ro --volume ${VOLUME_NAME}:/usr/src ${IMAGE_TAG}"

runner() {
	( set -x ; "${@}" )
}
