require "vagrant-shell"
require "vagrant-shell/ssh-agent"

VagrantPlugins::Shell::Plugin.make_provider(:static)

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'static'

Vagrant.configure("2") do |config|
  config.vm.provision :shell, :path => File.expand_path("../libexec/self-init", __FILE__)

  config.vm.provider :virtualbox do |vbox, override|
    override.ssh.username = 'ubuntu'
    override.vm.box = "precise"
    override.vm.base_mac = "auto"
  end

  config.vm.provider :static do |shell, override|
    override.ssh.username = ENV['LOGNAME']
    override.vm.box = "static"
    shell.image = 'localhost'
    shell.script = shell.find_script("static")
  end
end
