ansible-galaxy collection install -r requirements.yml

# create cluster
ansible-playbook kvmcluster.yml --tags setup
ansible-playbook kvmcluster.yml --tags list
ansible-playbook kvmcluster.yml --tags teardown

# ping all cluster
ansible -i inventory.yml cluster -u vagrant -e ansible_ssh_private_key_file=kvm -m ping 
ansible -i inventory.yml cluster  -m ansible.builtin.shell -a 'date'


