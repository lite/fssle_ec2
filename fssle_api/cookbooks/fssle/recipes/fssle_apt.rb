#
# Cookbook Name:: fssle
# Recipe:: default
#
# Copyright 2011, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
require_recipe "apt"

apt_repository "fssle" do
  uri "http://dev.fssle.com/deb"
  components ["main","stable"]
  action :add
end
