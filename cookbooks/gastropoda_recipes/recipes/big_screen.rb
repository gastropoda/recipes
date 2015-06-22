cookbook_file "/etc/X11/Xsession.d/45_big_screen" do
  source "big_screen"
  owner "root"
  group "root"
end

