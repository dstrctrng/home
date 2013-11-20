require "vagrant-shell"
require "vagrant-shell/ssh-agent"

VagrantPlugins::Shell::Plugin.make_provider(:static)

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'static'

Vagrant.configure("2") do |config|
  config.vm.box = "static"
  config.ssh.username = ENV['LOGNAME']

  config.vm.provision :shell, :path => File.expand_path("../libexec/self-init", __FILE__)

  config.vm.provider :static do |shell, override|
    shell.image = 'localhost'
    shell.script = shell.find_script("static")
  end
end
