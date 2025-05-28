#!/bin/bash
set -euo pipefail

BASTION_IP=$1
PRIVATE_IP=$2
KEY_PATH=$(realpath "$3")

# Write SSH config
cat > ~/.ssh/config <<EOF
Host bastion
  HostName ${BASTION_IP}
  User ubuntu
  IdentityFile ${KEY_PATH}
  StrictHostKeyChecking no
  UserKnownHostsFile=/dev/null

Host private-server
  HostName ${PRIVATE_IP}
  User ubuntu
  IdentityFile ${KEY_PATH}
  ProxyJump bastion
  StrictHostKeyChecking no
  UserKnownHostsFile=/dev/null
EOF

chmod 600 ~/.ssh/config
echo "Jump Server configured in ~/.ssh/config"
