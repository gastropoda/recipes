package "libsdl1.2debian"
# this one makes sure the virtualbox kernel driver gets
# updated on kernel upgrades
package "dkms"

essential_packages_remote_deb "http://download.virtualbox.org/virtualbox/4.3.28/virtualbox-4.3_4.3.28-100309~Ubuntu~raring_amd64.deb"
