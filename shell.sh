#!/usr/bin/env bash
set -e
source $(dirname $0)/shared.sh

# Build, install, unit tests, testsuite and process coverage.
runner sudo docker run --privileged -it -e TERM=$TERM ${DOCKER_ARGS} env bash
