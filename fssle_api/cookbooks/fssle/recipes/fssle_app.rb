# This recipe installs the rea-env gem for the
# fssle user. 

package "runit"
package "libxml2-dev"

gem_package "RedCloth"
gem_package "gollum"

user "fssle" do
   comment "Fssle User"
   system  true
   home    "/opt/fssle"
   shell   "/bin/bash"
   supports  :manage_home => true
end

directory "/opt/fssle/git" do
    owner "fssle"
    group "fssle"
    mode "0750"
end

execute "get source by git clone" do
    command "git clone git clone git://github.com/mojombo/jekyll.wiki.git wiki" 
    user "fssle"
    group "fssle"
    cwd "/opt/fssle/git"
    timeout 300
end

execute "run gollum" do
  command "gollum --port 80"
  user "fssle"
  group "fssle"
  cwd "/opt/fssle/git/wiki"
  timeout 300
end
