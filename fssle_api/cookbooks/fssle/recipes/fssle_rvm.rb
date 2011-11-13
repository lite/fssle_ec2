# see: http://li109-47.members.linode.com/blog/
package "curl"
package "git-core"
 
include_recipe "build-essential"
 
%w(libreadline5-dev zlib1g-dev libssl-dev libxml2-dev libxslt1-dev).each do |pkg|
  package pkg
end
 
bash "install RVM" do
  user "root"
  code "bash < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)"
  #not_if "rvm --version"
end
 
log "run bashrc"
bash "enable rvm" do
  user "root"
  code "source ~/.bashrc"
end

#bash "install REE in RVM" do
#  user "root"
#  code "rvm install ree"
#  not_if "rvm list | grep ree"
#end
 
#bash "make REE the default ruby" do
#  user "root"
#  code "rvm --default ree"
#end
 
gem_package "chef" # re-install the chef gem into REE to enable subsequent chef-client runs
