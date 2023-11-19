#!/bin/ash
# Not bash for alpine

# set -x

if [ "$(stat -c '%U%a' /etc/ssh/ssh_host_rsa_key)" = "root600" ]; then
  echo "Confirmed: /etc/ssh/ssh_host_rsa_key"
else
  echo "Bad permission: /etc/ssh/ssh_host_rsa_key"
  exit 1
fi

# shuffle the password
echo "remote:$(openssl rand -hex 12)" | chpasswd
echo "root:$(openssl rand -hex 12)" | chpasswd

exec /usr/sbin/sshd -D
#exec /usr/sbin/sshd -D -e
