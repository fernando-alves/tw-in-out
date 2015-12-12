#!/usr/bin/env bash

set -e

function _colored()   { tput -Txterm setaf ${1}; echo -e ${2}; tput -Txterm sgr0; }
function log_error()     { _colored 1 "${1}"; } # use for failures
function log_action()  { _colored 3 "${1}"; } # use for warnings / attention
function log_command() { _colored  "${1}"; } # use for debug messages

readonly MACHINE_NAME="tw-in-out"
readonly IS_OLDER_DOCKER=$(docker-machine -v | grep -c "0.3")
readonly HAS_MACHINE=$(docker-machine ls | grep -c $MACHINE_NAME)
readonly HAS_RUNNING_MACHINE=$(docker-machine ls | grep $MACHINE_NAME | grep -c "Running")

if [[ $IS_OLDER_DOCKER -ne 0 ]]; then
  log_error "Error: Your docker-machine version is older; Please update your docker-machine to > 0.3"
  exit
fi

if [ $HAS_MACHINE -eq 0 ]; then
  log_action "Creating machine ..."
  docker-machine create -d virtualbox $MACHINE_NAME
  eval "$(docker-machine env $MACHINE_NAME)"
fi

log_action "Starting machine ..."
docker-machine start $MACHINE_NAME
eval "$(docker-machine env $MACHINE_NAME)"

if [[ ! -z $DOCKER_HOST ]]; then
  log_action "Initializing docker ..."
  docker-compose build
  docker-compose up -d
fi

log_action 'Done!'

echo -e `docker-machine ls | grep ${MACHINE_NAME}`
