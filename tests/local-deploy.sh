#!/usr/bin/env bash

set -ex

DEPLOY_ARGS="provider=local server=10.0.8.100 ssh_user=ubuntu endpoint=10.0.8.100 dns_adblocking=true install_headers=false tests=true local_service_ip=172.16.0.1"

if [ "${DEPLOY}" == "docker" ]
then
  docker run -i -v $(pwd)/config.cfg.example:/ralgo/config.cfg -v ~/.ssh:/root/.ssh -v $(pwd)/configs:/ralgo/configs -e "DEPLOY_ARGS=${DEPLOY_ARGS}" local/ralgo /bin/sh -c "chown -R root: /root/.ssh && chmod -R 600 /root/.ssh && source venvs/.env/bin/activate && ansible-playbook main.yml -e \"${DEPLOY_ARGS}\" --skip-tags debug"
else
  cp config.cfg.example config.cfg
  ansible-playbook main.yml -e "${DEPLOY_ARGS}"
fi
