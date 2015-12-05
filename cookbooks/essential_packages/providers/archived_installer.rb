require "uri"

use_inline_resources

action :install do
  url = new_resource.url
  base_name = ::File.basename(::URI.parse(url).path)
  cached_file = "#{Chef::Config[:file_cache_path]}/#{base_name}"
  dirname = base_name.sub(/\.\w+$/, "")
  extracted_path = "#{Chef::Config[:file_cache_path]}/#{dirname}"
  install_pwd = "#{extracted_path}/#{::File.dirname(new_resource.executable)}"
  install = ::File.basename(new_resource.executable)

  remote_file cached_file do
    source url
  end

  bash "extract archived installer" do
    code <<-__
      mkdir -p #{extracted_path}
      tar xzf #{cached_file} -C #{extracted_path}
    __
    not_if { ::File.exists?(extracted_path) }
  end

  bash "run the installer" do
    code <<-__
      cd #{install_pwd}
      chmod +x #{install}
      ./#{install}
    __
  end
end

