# Cookbook Name:: fssle
# Recipe:: default
#
# Copyright 2011, Fssle
#
# All rights reserved - Do Not Redistribute
#
require_recipe "fssle::essential"
require_recipe "fssle::fssle_aws"
require_recipe "fssle::repository"
require_recipe "fssle::fssle_rvm"
require_recipe "fssle::fssle_app"


