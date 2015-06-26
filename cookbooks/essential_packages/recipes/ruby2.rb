package "ruby2.0"
package "ruby2.0-dev"

# See https://bugs.launchpad.net/ubuntu/+source/ruby2.0/+bug/1310292
# and https://bugs.launchpad.net/ubuntu/+source/ruby2.0/+bug/1310292/comments/25
bash "Make ruby2 default" do
  code <<-__
    dpkg-divert --add --rename --divert /usr/bin/ruby.divert /usr/bin/ruby
    update-alternatives --install /usr/bin/ruby ruby /usr/bin/ruby2.0 1
  __
  creates "/usr/bin/ruby.divert"
end

bash "Make gem2 default" do
  code <<-__
    dpkg-divert --add --rename --divert /usr/bin/gem.divert /usr/bin/gem
    update-alternatives --install /usr/bin/gem gem /usr/bin/gem2.0 1
  __
  creates "/usr/bin/gem.divert"
end

