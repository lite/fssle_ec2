# This recipe installs the rea-env gem for the
# fssle user. 

gem_package "rails"

bash "new myproj" do
  user "root"
  cwd "/tmp"
  code <<-EOH
    rails new myproj
    cd myproj
    bundle install
  EOH
end

web_app 'myproj' do
  docroot "/tmp/myproj/public"
  template "myproj.conf.erb"
  server_name "www.fssle.com"
  rails_env "production" 
end

apache_site "000-default" do
  enable false
end
