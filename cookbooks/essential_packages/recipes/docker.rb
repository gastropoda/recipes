package "curl"

bash "Install docker" do
  code "curl -sSL https://get.docker.com/ | sh"
  not_if { File.exists?("/usr/bin/docker") }
end
