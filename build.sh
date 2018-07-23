#!/usr/bin/env bash
set -e
source $(dirname $0)/shared.sh

runner sudo docker build --force-rm --tag ${IMAGE_TAG} docker/
runner sudo docker volume create ${VOLUME_NAME} > /dev/null
