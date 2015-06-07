#
# Cookbook Name:: gastropoda_recipes
# Recipe:: default
#
# Copyright 2015, artm
#
# All rights reserved - Do Not Redistribute
#
git "/home/artm/.chef" do
  repository "git@github.com:gastropoda/recipes.git"
  revision "master"
  user "artm"
  group "artm"
  action :sync
  notifies :create, "ruby_block[reload_cookbooks]", :immediately
end

ruby_block "reload_cookbooks" do
  block do
    Chef::Config.from_file("#{node["chef_client"]["conf_dir"]}/client.rb")
  end
  action :nothing
end
