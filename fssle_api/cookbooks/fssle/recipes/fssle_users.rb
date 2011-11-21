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


