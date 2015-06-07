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
  notifies :run, "ruby_block[chef-client]", :delayed
end

ruby_block "chef-client" do
  block do
    spawn "chef-client"
  end
  action :nothing
end
