#!/usr/bin/env sh

set -ex

METHOD="${1:-${METHOD:-cloud}}"
DNS_ADBLOCKING="${6:-${DNS_ADBLOCKING:-false}}"
ENDPOINT="${8:-${ENDPOINT:-localhost}}"
USERS="${9:-${USERS:-user1}}"
REPO_SLUG="${10:-${REPO_SLUG:-dorian8013/ralgo}}"
REPO_BRANCH="${11:-${REPO_BRANCH:-master}}"
EXTRA_VARS="${12:-${EXTRA_VARS:-placeholder=null}}"
ANSIBLE_EXTRA_ARGS="${13:-${ANSIBLE_EXTRA_ARGS}}"

cd /opt/

installRequirements() {
  export DEBIAN_FRONTEND=noninteractive
  apt-get update
  apt-get install \
    software-properties-common \
    git \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev \
    python3-pip \
    python3-setuptools \
    python3-virtualenv \
    bind9-host \
    jq -y
}

getrAlgo() {
  [ ! -d "ralgo" ] && git clone "https://github.com/${REPO_SLUG}" -b "${REPO_BRANCH}" ralgo
  cd ralgo

  python3 -m virtualenv --python="$(command -v python3)" .venv
  # shellcheck source=/dev/null
  . .venv/bin/activate
  python3 -m pip install -U pip virtualenv
  python3 -m pip install -r requirements.txt
}

publicIpFromInterface() {
  echo "Couldn't find a valid ipv4 address, using the first IP found on the interfaces as the endpoint."
  DEFAULT_INTERFACE="$(ip -4 route list match default | grep -Eo "dev .*" | awk '{print $2}')"
  ENDPOINT=$(ip -4 addr sh dev "$DEFAULT_INTERFACE" | grep -w inet | head -n1 | awk '{print $2}' | grep -oE '\b([0-9]{1,3}\.){3}[0-9]{1,3}\b')
  export ENDPOINT=$ENDPOINT
  echo "Using ${ENDPOINT} as the endpoint"
}

publicIpFromMetadata() {
  if test "$(curl -s http://169.254.169.254/latest/meta-data/services/domain)" = "amazonaws.com"; then
    ENDPOINT="$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)"
  fi

  if echo "${ENDPOINT}" | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"; then
    export ENDPOINT=$ENDPOINT
    echo "Using ${ENDPOINT} as the endpoint"
  else
    publicIpFromInterface
  fi
}

deployrAlgo() {
  getrAlgo

  cd /opt/ralgo
  # shellcheck source=/dev/null
  . .venv/bin/activate

  export HOME=/root
  export ANSIBLE_LOCAL_TEMP=/root/.ansible/tmp
  export ANSIBLE_REMOTE_TEMP=/root/.ansible/tmp

  # shellcheck disable=SC2086
  ansible-playbook main.yml \
    -e provider=local \
    -e "dns_adblocking=${DNS_ADBLOCKING}" \
    -e "endpoint=$ENDPOINT" \
    -e "users=$(echo "$USERS" | jq -Rc 'split(",")')" \
    -e server=localhost \
    -e ssh_user=root \
    -e "${EXTRA_VARS}" \
    --skip-tags debug ${ANSIBLE_EXTRA_ARGS} |
      tee /var/log/ralgo.log
}

if test "$METHOD" = "cloud"; then
  publicIpFromMetadata
fi

installRequirements

deployrAlgo
