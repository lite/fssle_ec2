# This recipe installs the rea-env gem for the
# fssle user. 

# Make sure we have a fssle user
gem_package "gollum"
gem_package "RedCloth"

deploy_to="/tmp"
app_id="mywiki"

execute "get source by git clone" do
  command "git clone git://github.com/lite/fssle_wiki.git #{app_id}" 
  not_if {File.exists?("#{deploy_to}/#{app_id}")}
  user "root"
  cwd "#{deploy_to}"
  timeout 300
end

template "#{deploy_to}/#{app_id}/config.ru" do
  source "config.ru.erb"
end

bash "run bundle install" do
  user "root"
  cwd "#{deploy_to}/#{app_id}"
  code <<-EOH
    bundle install
  EOH
end

web_app 'mywiki' do
  docroot "#{deploy_to}/#{app_id}/public"
  template "mywiki.conf.erb"
  server_name "www.fssle.com"
end

apache_site "000-default" do
  enable false
end

# directory "/opt/fssle/git" do
#   owner "fssle"
#   group "fssle"
#   mode "0750"
#   recursive true
# end

# execute "run gollum" do
#   command "gollum --port 8080"
#   user "fssle"
#   group "fssle"
#   cwd "/opt/fssle/git/wiki"
#   timeout 300
# end
