#
# Cookbook Name:: rcm
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

base_name = "rcm_1.2.3-1_all.deb"
url_base = "https://thoughtbot.github.io/rcm/debs"
cached_file = "#{Chef::Config[:file_cache_path]}/#{base_name}"

remote_file cached_file do
  source "#{url_base}/#{base_name}"
end

dpkg_package cached_file do
  action :install
end
