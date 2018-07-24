#!/usr/bin/env bash
set -e
source $(dirname $0)/shared.sh

# Build, install, unit tests, testsuite and process coverage.
runner sudo docker run --privileged ${DOCKER_ARGS} asterisk-ci-full

# Update ./output and ./testsuite from docker volume.
runner git rm -qfr output testsuite
echo "+ sudo docker run --workdir /usr/src/asterisk/tests/CI ${DOCKER_ARGS} tar -cf - output | tar xf -"
sudo docker run --workdir /usr/src/asterisk/tests/CI ${DOCKER_ARGS} tar -cf - output | tar xf -
echo "+ sudo docker run --workdir /usr/src ${DOCKER_ARGS} tar -cf - testsuite/asterisk-test-suite-report.xml testsuite/logs/ | tar xf -"
sudo docker run --workdir /usr/src ${DOCKER_ARGS} tar -cf - testsuite/asterisk-test-suite-report.xml testsuite/logs/ | tar xf -
runner git add output testsuite
