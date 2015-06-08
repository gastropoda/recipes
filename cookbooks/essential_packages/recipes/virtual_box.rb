require "uri"

url = "http://download.virtualbox.org/virtualbox/4.3.28/virtualbox-4.3_4.3.28-100309~Ubuntu~raring_amd64.deb"
base_name = File.basename(URI.parse(url).path)
cached_file = "#{Chef::Config[:file_cache_path]}/#{base_name}"

remote_file cached_file do
  source url
end

package "libsdl1.2debian"

dpkg_package cached_file do
  action :install
end
