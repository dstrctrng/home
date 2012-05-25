alias :gex :gem
def gem (nm_gem, opt_gem = {})
  if ENV.member? "local_#{nm_gem}"
    local_opt = {}
    local_opt[:path] = File.join(File.expand_path('../gems', __FILE__), nm_gem)
    unless File.directory? local_opt[:path]
      puts "cannot find local gem #{local_opt[:path]}"
      exit 1
    end
    gex nm_gem, local_opt
  else
    local_opt = opt_gem.clone
    gex nm_gem, local_opt
  end
end

source :rubygems
source "http://localhost:9292"

# irb
gem "wirble"
gem "interactive_editor"
gem "awesome_print"

# configuration
gem "microwave"
gem "tvd-bundler"
gem "tvd-git"
gem "tvd-rubygems"
gem "tvd-ssh"
gem "tvd-dmg"

# secrets
gem "80ae2fe5c929b7d0a00bdee2d710fa9e"

# vim: set ft=ruby:
