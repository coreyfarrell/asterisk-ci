#!/usr/bin/env bash
set -e
source $(dirname $0)/shared.sh

console_title "Building container '${IMAGE_TAG}' and volume '${VOLUME_NAME}'."
runner sudo docker build --force-rm --tag ${IMAGE_TAG} docker/
runner sudo docker volume create ${VOLUME_NAME} > /dev/null
