# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.network :forwarded_port, guest: 8000, host: 8888

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  # Upgrade Chef automatically
  config.vm.provision :shell, :inline => "gem install --no-ri --no-rdoc chef"

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks", "site-cookbooks"]
    chef.add_recipe "python"
    chef.add_recipe "postgresql::server_debian"
    chef.add_recipe "postgresql::ruby"
    chef.add_recipe "postgresql::psycopg2"
    chef.add_recipe "gswd::database"
    chef.add_recipe "vim"
    chef.json = {
      :app_user => "vagrant",
      :home_folder => "/home/vagrant/",
      :source_folder => "/vagrant/project/microblog/",
      :postgresql => {
        :listen_addresses => '*',
        :password => {:postgres => "gswd"}
      },
      :redis => {
        :config => {
          :listen_addr => '0.0.0.0'
        },
        :install_type => 'source',
        :source => {
          :version => '2.4.17',
        },
      },
    }
  end
end
