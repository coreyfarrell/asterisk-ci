cd $(dirname $0)

IMAGE_TAG=${IMAGE_TAG:-asterisk-ci:f28}
VOLUME_NAME=${VOLUME_NAME:-asterisk-ci}
DOCKER_ARGS="--rm --volume /etc/localtime:/etc/localtime:ro --volume ${VOLUME_NAME}:/usr/src ${IMAGE_TAG}"

console_title() {
	case "$TERM" in
	xterm*)
		printf "\007\033]0;%s\007" "$1"
		;;
	*)
		;;
	esac
}

runner() {
	( set -x ; "${@}" )
}
