#
# Cookbook Name:: dotfiles
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "rcm"

package "git"

git "/home/artm/dotfiles" do
  repository "git@github.com:gastropoda/dotfiles.git"
  revision "master"
  user "artm"
  group "artm"
  action :sync
end

bash "Install dotfiles" do
  code "rcup -f"
  user "artm"
  group "artm"
  cwd "/home/artm"
  environment "HOME" => "/home/artm", "USER" => "artm", 
              "RCRC" => "/home/artm/dotfiles/rcrc"
end
