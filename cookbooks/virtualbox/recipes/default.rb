dmg_package "virtualbox" do
  source "file://#{ENV['HOME']}/vault/software/VirtualBox-4.1.14-77440-OSX.dmg"
  action :install
end
