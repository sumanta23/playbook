Vagrant.configure("2") do |config|
  # Base VM OS configuration.
  config.vm.box = "ubuntu/focal64"
  config.vm.synced_folder '.', '/vagrant', disabled: true
  config.ssh.insert_key = false
  public_key_path = File.join(File.dirname(__FILE__), "kvm.pub")
  if File.exist?(public_key_path)
    ssh_pub_key = File.readlines(public_key_path).first.strip
  end

  config.vm.provider :virtualbox do |v|
    v.memory = 512
    v.cpus = 1
    v.linked_clone = true
  end

  # Define four VMs with static private IP addresses.
  boxes = [
    { :name => "node1", :ip => "192.168.122.2" },
    { :name => "node2", :ip => "192.168.122.3" },
    { :name => "node3", :ip => "192.168.122.4" },
    { :name => "node4", :ip => "192.168.122.5" },
    { :name => "node5", :ip => "192.168.122.6" },
    { :name => "node6", :ip => "192.168.122.7" },
  ]

  # Provision each of the VMs.
  boxes.each do |opts|
    config.vm.define opts[:name] do |config|
      config.vm.hostname = opts[:name]
      config.vm.network :private_network, ip: opts[:ip]
      config.vm.provision 'shell', inline: "echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys", privileged: false
    end
  end
end
