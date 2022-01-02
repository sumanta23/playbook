ansible-galaxy collection install -r requirements.yml

# Inventory list
ansible-inventory -i inventory.ini  --list

# List Tasks & tags & hosts
ansible-playbook -i inventory.ini mongodb.yml --list-tasks --list-tags --list-hosts


# create cluster
ansible-playbook kvmcluster.yml --tags setup
ansible-playbook kvmcluster.yml --tags list
ansible-playbook kvmcluster.yml --tags teardown

# ping all cluster
ansible -i inventory.yml cluster -u vagrant -e ansible_ssh_private_key_file=kvm -m ping 
ansible -i inventory.yml cluster  -m ansible.builtin.shell -a 'date'


# Install Mongodb
ansible-playbook -i inventory.ini mongodb.yml
## create mongodn replicaset
ansible-playbook -i inventory.ini mongodb_replicaset.yml

# install redis
ansible-playbook -i inventory.ini redis_cluster.yml --tag install

## install redis
ansible-playbook -i inventory.ini redis_cluster.yml --tag setup
