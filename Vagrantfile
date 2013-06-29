require 'socket'

ENV['SHELL_SCRIPT'] = 'static'
ENV['SHELL_IMAGE'] = "localhost"

require "vagrant-shell"
require "vagrant-shell/ssh-agent"
require "vagrant-shell/env-config"

Vagrant.configure("2") do |config|
  config.vm.box = "home"
  config.ssh.username = ENV['LOGNAME']

  script = ENV['SHELL_SCRIPT']
  config.vm.provider script.to_sym do |shell, override|
    shell.image = ENV['SHELL_IMAGE']
    shell.script = shell.find_script(script)
  end
end
