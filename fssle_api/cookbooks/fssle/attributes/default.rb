default[:fssle][:repository] = "http://dist/"
default[:fssle][:apt][:source] = "#{node[:fssle][:repository]}/debian"
default[:fssle][:gem][:source] = "#{node[:fssle][:repository]}/rubygems"

default[:fssle][:apps][:dir] = "/opt/fssle/apps"
default[:fssle][:conf][:dir] = "/opt/fssle/conf"
