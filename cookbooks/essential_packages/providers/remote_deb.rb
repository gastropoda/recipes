require "uri"

use_inline_resources

action :install do
  url = new_resource.url
  base_name = ::File.basename(::URI.parse(url).path)
  cached_file = "#{Chef::Config[:file_cache_path]}/#{base_name}"

  remote_file cached_file do
    source url
  end

  dpkg_package cached_file do
    action :install
    new_resource.updated_by_last_action(true)
  end
end
