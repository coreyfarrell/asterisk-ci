#!/usr/bin/env bash
set -e
source $(dirname $0)/shared.sh

DOCKER_ARGS="--rm --volume /etc/localtime:/etc/localtime:ro --volume ${VOLUME_NAME}:/usr/src ${IMAGE_TAG}"

# Build, install, unit tests, testsuite and process coverage.
runner sudo docker run --privileged ${DOCKER_ARGS} asterisk-ci-full

# Update ./output from docker volume.
runner git rm -fr output
echo "+ sudo docker run ${DOCKER_ARGS} asterisk-ci-tar | tar xf - --strip-components=2"
sudo docker run ${DOCKER_ARGS} asterisk-ci-tar | tar xf - --strip-components=2
runner git add output
