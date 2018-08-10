#!/usr/bin/env bash
set -e
source $(dirname $0)/shared.sh

console_title "Downloading results from container."
# Update ./output and ./testsuite from docker volume.
runner git rm -qfr output
echo "+ sudo docker run --workdir /usr/src/asterisk/tests/CI ${DOCKER_ARGS} tar -cf - output | tar xf -"
sudo docker run --workdir /usr/src/asterisk/tests/CI ${DOCKER_ARGS} tar -cf - output | tar xf -
runner git add output testsuite
