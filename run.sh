#!/usr/bin/env bash
set -e
source $(dirname $0)/shared.sh

console_title "Running asterisk-ci-full."
# Build, install, unit tests, testsuite and process coverage.
runner sudo docker run --privileged ${DOCKER_ARGS} asterisk-ci-full "$@"
