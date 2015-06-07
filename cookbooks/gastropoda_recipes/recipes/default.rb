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
  notifies :run, "bash[chef-client]", :delayed
end

bash "chef-client" do
  code "killall chef-client ; chef-client"
  action :nothing
end
