if platform?("debian")

  #execute "wget -O - #{node.fssle.apt.source}/dists/archive.key | apt-key add -" do
  #  not_if "apt-key list | grep 'Fssle'"
  #end

  include_recipe "apt"

  template "/etc/apt/sources.list.d/backports.list" do
    source "lenny-backports.erb"
    mode 0644
    owner "root"
    group "root"
    notifies :run, resources(:execute => "apt-get update"), :immediately
  end

  template "/etc/apt/sources.list.d/fssle.list" do
    source "fssle-apt-source.erb"
    mode 0644
    owner "root"
    group "root"
    notifies :run, resources(:execute => "apt-get update"), :immediately
  end
end
