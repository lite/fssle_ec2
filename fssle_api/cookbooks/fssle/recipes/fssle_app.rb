# This recipe installs the rea-env gem for the
# fssle user. 

# Make sure we have a fssle user
user "fssle" do
   comment "Fssle User"
   system  true
   home    "/opt/fssle"
   shell   "/bin/bash"
   supports  :manage_home => true
end

execute "add local gem environment" do
    command "echo -e 'GEM_HOME=$HOME/.gem export GEM_HOME\nPATH=$PATH:$GEM_HOME/bin export PATH' >> /opt/fssle/.bash_profile"
    not_if "grep GEM_HOME /opt/fssle/.bash_profile"
end

execute "gem install gollum" do
    command "gem install gollum --no-rdoc --no-ri"
    creates "/opt/fssle/.gem/bin/gollum"
    cwd "/opt/fssle"
    user "fssle"
    group "fssle"
    timeout 300
end

execute "gem install RedCloth" do
    command "gem install RedCloth --no-rdoc --no-ri"
    cwd "/opt/fssle"
    user "fssle"
    group "fssle"
    timeout 300
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
