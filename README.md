ansible-galaxy collection install -r requirements.yml

# create cluster
ansible-playbook kvmcluster.yml --tags setup
ansible-playbook kvmcluster.yml --tags list
ansible-playbook kvmcluster.yml --tags teardown
