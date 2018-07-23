cd $(dirname $0)

IMAGE_TAG=${IMAGE_TAG:-asterisk-ci:f28}
VOLUME_NAME=${VOLUME_NAME:-asterisk-ci-test}

runner() {
	( set -x ; "${@}" )
}
