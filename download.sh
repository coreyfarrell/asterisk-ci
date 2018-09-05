#!/usr/bin/env bash
set -e
source $(dirname $0)/shared.sh

console_title "Downloading results from container."
# Update ./output from docker volume.
runner rm -fr output || true
echo "+ sudo docker run --workdir /usr/src/asterisk/tests/CI ${DOCKER_ARGS} tar -cf - output | tar xf -"
sudo docker run --workdir /usr/src/asterisk/tests/CI ${DOCKER_ARGS} tar -cf - output | tar xf -
