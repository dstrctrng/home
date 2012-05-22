def gex (nm_gem, opt_gem = {})
  if ENV.member? "local_#{nm_gem}"
    local_opt = {}
    local_opt[:path] = File.join(File.expand_path('../gems', __FILE__), nm_gem)
    gem nm_gem, local_opt
  else
    local_opt = opt_gem.clone
    gem nm_gem, local_opt
  end
end

source :rubygems

# language
gem "ampex"

# irb
gem "wirble"
gem "interactive_editor"
gem "bosonson"
gem "awesome_print"

# packaging
gem "80ae2fe5c929b7d0a00bdee2d710fa9e"
gem "private_event"
gem "sous"

# configuration
gex "microwave"
gem "tvd-bundler"
gem "tvd-git"
gem "tvd-rubygems"
gem "tvd-ssh"
gem "tvd-dmg"

# deploy
gem "alpha_omega"

# documentation
gem "rtfmd"
gem "showoff"
gem "rocco"
gem "jekyll"

# servers
gem "sinatra"
gem "thin"

# vim: set ft=ruby:
