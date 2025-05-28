#!/bin/bash
set -e

BASTION_IP=$1
PRIVATE_IP=$2
KEY_PATH=$3

cat > ../Ansible/ansible.cfg <<EOF
[defaults]
inventory = inventory.ini
remote_user = ubuntu
private_key_file = ${KEY_PATH}
host_key_checking = False
retry_files_enabled = False

[privilege_escalation]
become           = true
become_ask_pass  = false
EOF

cat > ../Ansible/inventory.ini <<EOF
[public_servers]
bastion

[private_servers]
private-server

[public_servers:vars]
bastion_ip=${BASTION_IP}

[private_servers:vars]
private_ip=${PRIVATE_IP}

EOF

echo "Ansible files configured with:"
echo "  bastion_ip: ${BASTION_IP}"
echo "  private_ip: ${PRIVATE_IP}"

cd ../Ansible/
pwd
ansible-playbook playbook.yaml
