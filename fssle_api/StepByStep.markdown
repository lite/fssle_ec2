chef
====

[Quick Start](http://wiki.opscode.com/display/chef/Quick+Start)
[Ruby and Opscode Chef packages for RHEL distributions](http://rbel.frameos.org/)
[Vagrant rocks](http://lumberjaph.net/misc/2010/11/22/vagrant-rocks.html)
[Setting up a Rails 3 development environment](http://www.improvingwetware.com/2011/01/13/setting-up-a-rails-3-development-environment)

workstation
----

prepare

    gem update --system
    gem install chef
    cd ~
    git clone git://github.com/opscode/chef-repo.git

    mkdir -p ~/chef-repo/.chef
    cp USERNAME.pem ~/chef-repo/.chef
    cp ORGANIZATION-validator.pem ~/chef-repo/.chef
    cp knife.rb ~/chef-repo/.chef

cookbooks and bootstrap

    cd ~/chef-repo
    ln -sn `pwd`/cookbooks ~/.chef
    ln -sn `pwd`/bootstrap ~/.chef
    knife client list
    knife cookbook site vendor chef-client  
    knife cookbook upload chef-client

bootstrap

    ssh root@fssle.com 'sh -c "mkdir ~/.ssh"'
    scp ~/.ssh/id_rsa.pub root@fssle.com:/root/.ssh/authorized_keys
    ssh root@fssle.com 'sh -c "uname -a;cat /etc/lsb-release"'
    knife bootstrap fssle.com -r "recipe[chef-client]" -x root

    ssh root@www.fssle.com 'sh -c "mkdir ~/.ssh"'
    scp ~/.ssh/id_rsa.pub root@www.fssle.com:/root/.ssh/authorized_keys 
    ssh root@www.fssle.com 'sh -c "uname -a;cat /etc/lsb-release"'
    knife bootstrap www.fssle.com -r 'recipe[chef-client]' -x root -d rhel5-rbel 

knife node

    {
      "name": "fssle",
      "default_attributes": {
        "chef": {
          "server_url": "https://api.opscode.com/organizations/fssle",
          "cache_path": "/var/chef/cache",
          "backup_path": "/var/chef/backup",
          "validation_client_name": "fssle-validator",
          "run_path": "/var/chef"
        }
      },
      "json_class": "Chef::Role",
      "run_list": [
        "recipe[dev-fssle]", 
      ],
      "description": "Basic Server",
      "chef_type": "role",
      "override_attributes": {
      }
    }

knife role

    knife role create fssle
    knife role from file roles/fssle.rb

    knife node create www.fssle.com             
    knife node create dev.fssle.com

    knife node run_list remove "dev.fssle.com" "role[base]"
    knife node run_list add "dev.fssle.com" dev_fssle
    knife node run_list add "www.fssle.com" www_fssle

    knife cookbook site vendor apt -o `pwd`/cookbooks/
    knife cookbook site vendor yum -o `pwd`/cookbooks/ 
              
    knife cookbook bulk delete ^.+$                      
    knife cookbook upload www_fssle dev_fssle -o `pwd`/cookbooks/ -VV

 
client
----

update

    chef-client -l debug
    chef-client -i 3600 -s 600 

    ssh root@fssle.com 'sh -c "chef-client"'
    ssh root@www.fssle.com 'sh -c "chef-client"' 
