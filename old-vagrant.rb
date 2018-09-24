### Not used anymore

# Centos VMs 

centos_memory = {1 => "1024" , 2=> "2048" }

Vagrant.configure("2") do |configs|

    (1..2).each do |i|

        num = "%02d" % [i]
        configs.vm.define "centos-#{num}" do |config|

        # OS
        config.vm.box = "centos/7"
        config.vm.network "private_network", ip: "192.168.33.1#{num}"

        # Memory 
        config.vm.provider "virtualbox" do |vb|
            
            # Name in VirtualBox
            vb.name = "centos-#{num}"
            
            # Customize the amount of memory on the VM: e.g 512 1024 2048 4096
            if centos_memory.key?(i)
            vb.memory = centos_memory[i]
            else
            vb.memory = "1024"
            end


        end
        
        # Ssh
        config.ssh.insert_key = true
        

        # # Bash
        # config.vm.provision "shell", inline: <<-SHELL
        #   adduser centos-#{num}
        # SHELL

        end

    end

end
