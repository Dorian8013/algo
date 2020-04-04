#!/bin/bash
set -eux

which sudo || until \
  apt-get update -y && \
  apt-get install sudo -yf --install-suggests; do
  sleep 3
done

getent passwd ralgo || useradd -m -d /home/ralgo -s /bin/bash -G adm -p '!' ralgo

(umask 337 && echo "ralgo ALL=(ALL) NOPASSWD:ALL" >/etc/sudoers.d/10-ralgo-user)

cat <<EOF >/etc/ssh/sshd_config
{{ lookup('template', 'files/cloud-init/sshd_config') }}
EOF

test -d /home/ralgo/.ssh || (umask 077 && sudo -u ralgo mkdir -p /home/ralgo/.ssh/)
echo "{{ lookup('file', '{{ SSH_keys.public }}') }}" | (umask 177 && sudo -u ralgo tee /home/ralgo/.ssh/authorized_keys)

dpkg -l sshguard && until apt-get remove -y --purge sshguard; do
  sleep 3
done || true

systemctl restart sshd.service
