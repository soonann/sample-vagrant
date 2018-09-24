

# allow ssh password authentication
$ssh_script = <<-SHELL
    sudo sed --in-place 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
    sudo service sshd restart
SHELL


# centos-01
Vagrant.configure("2") do |configs|

    vm_name = "centos-01"
    configs.vm.define vm_name do |config|
            
        config.vm.box = "centos/7"
        config.vm.network "private_network", ip: "192.168.33.101"
        config.vm.hostname = vm_name
        
        config.vm.provider "virtualbox" do |vb|
            vb.name = vm_name
            vb.memory = "1024"
        end
        config.ssh.insert_key = true

        config.vm.provision "shell", inline: $ssh_script
        

    end

end

# centos-02
Vagrant.configure("2") do |configs|

    vm_name = "centos-02"
    configs.vm.define vm_name do |config|
            
        config.vm.box = "centos/7"
        config.vm.network "private_network", ip: "192.168.33.102"
        config.vm.hostname = vm_name

        config.vm.provider "virtualbox" do |vb|
            vb.name = vm_name
            vb.memory = "1024"
        end
        config.ssh.insert_key = true

        config.vm.provision "shell", inline: $ssh_script

    end

end




# notebook-01

Vagrant.configure("2") do |configs|

    vm_name = "notebook-01"
    configs.vm.define vm_name do |config|
            
        config.vm.box = "centos/7"
        config.vm.network "private_network", ip: "192.168.33.103"
        config.vm.network "forwarded_port", guest: 8888, host: 8880
        config.vm.hostname = vm_name

        config.vm.provider "virtualbox" do |vb|
            vb.name = vm_name
            vb.memory = "1024"
        end
        config.ssh.insert_key = true

        config.vm.provision "shell", inline: $ssh_script

    end

end

# docker-01
Vagrant.configure("2") do |configs|
    
    vm_name = "docker-01"
    configs.vm.define vm_name do |config|

        
        config.vm.box = "centos/7"
        config.vm.network "private_network", ip: "192.168.33.104"
        config.vm.hostname = vm_name

        config.vm.provider "virtualbox" do |vb|
            vb.name = vm_name
            vb.memory = "1024"
        end
        config.ssh.insert_key = true

        config.vm.provision "shell", inline: $ssh_script

    end

end


# esp52
Vagrant.configure("2") do |configs|

    vm_name = "esp52"
    configs.vm.define vm_name do |config|
            
        config.vm.box = "centos/7"
        #config.vm.network "private_network", ip: "192.168.33.111"
        config.vm.hostname = vm_name + ".sgp.sas.com"
        
        config.vm.provider "virtualbox" do |vb|
            vb.name = vm_name
            #vb.memory = "1024"
            vb.memory = "8192"
            vb.cpus = 4

        end
        config.ssh.insert_key = true

        config.vm.provision "shell", inline: $ssh_script 
    end

end


