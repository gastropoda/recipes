cookbook_file "/etc/polkit-1/localauthority/50-local.d/com.ubuntu.enable-hibernate.pkla" do
  source "com.ubuntu.enable-hibernate.pkla"
  owner "root"
  group "root"
end

