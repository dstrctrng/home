require 'socket'

ENV['SHELL_SCRIPT'] = 'static'

require "vagrant-shell"
require "vagrant-shell/ssh-agent"
require "vagrant-shell/env-config"

Vagrant.configure("2") do |config|
  config.vm.box = "home"
  config.ssh.username = ENV['LOGNAME']

  config.vm.provision :shell, :path => File.expand_path("../libexec/self-init", __FILE__)

  config.vm.provider :static do |shell, override|
    shell.image = 'localhost'
    shell.script = shell.find_script("static")
  end
end
