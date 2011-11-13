package "less"
package "screen"
package "sudo"
package "zip"
package "unzip"
package "curl"
package "build-essential"
package "git-core"

case node[:platform] 
when "ubuntu","debian"
  package "dnsutils" do
    action :install
  end
  package "vim-scripts"
  package "strace"
  package "ltrace"
  package "lsof"
  package "lslk"
  package "netcat"
  package "telnet"
  package "tcpdump"
end

directory '/var/empty' do
  action :create
  mode '0555'
end

