#
# Cookbook Name:: gastropoda_recipes
# Recipe:: default
#
# Copyright 2015, artm
#
# All rights reserved - Do Not Redistribute
#

template "/etc/chef/client.rb" do
  source "client.rb.erb"
  owner "root"
  group "root"
  variables principal_user: "artm"
end

git "/home/artm/.chef" do
  repository "git@github.com:gastropoda/recipes.git"
  revision "master"
  user "artm"
  group "artm"
  action :sync
  notifies :run, "ruby_block[chef-client]", :delayed
end

ruby_block "chef-client" do
  block do
    # This will spawn another chef-client instance that will wait for this one to finish
    # and then run with new cookbooks
    spawn "chef-client"
  end
  action :nothing
end
