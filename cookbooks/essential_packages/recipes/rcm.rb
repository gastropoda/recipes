require "uri"

url = "https://thoughtbot.github.io/rcm/debs/rcm_1.2.3-1_all.deb"
base_name = File.basename(URI.parse(url).path)
cached_file = "#{Chef::Config[:file_cache_path]}/#{base_name}"

remote_file cached_file do
  source url
end

dpkg_package cached_file do
  action :install
end
