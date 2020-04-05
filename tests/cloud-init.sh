#!/bin/bash
echo "#!/bin/bash
export METHOD=local
export DNS_ADBLOCKING=true
export ENDPOINT=10.0.8.100
export USERS=desktop,user1,user2
export EXTRA_VARS='install_headers=false tests=true local_service_ip=172.16.0.1'
export ANSIBLE_EXTRA_ARGS=''
export REPO_SLUG=${REPOSITORY:-rhdsx/ralgo}
export REPO_BRANCH=${BRANCH:-master}

curl -s https://raw.githubusercontent.com/${REPOSITORY:-rhdsx/ralgo}/${BRANCH:-master}/install.sh | sudo -E bash -x"
