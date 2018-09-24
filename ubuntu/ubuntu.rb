
# ubuntu-01
Vagrant.configure("2") do |configs|

    vm_name = "ubuntu-01"
    configs.vm.define vm_name do |config|
            
        config.vm.box = "ubuntu/trusty64"
        config.vm.network "private_network", ip: "192.168.34.101"
        config.vm.hostname = vm_name
        
        config.vm.provider "virtualbox" do |vb|
            vb.name = vm_name
            vb.memory = "2048"
        end
        config.ssh.insert_key = true

    end

end
