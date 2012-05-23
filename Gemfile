def gex (nm_gem, opt_gem = {})
  if ENV.member? "local_#{nm_gem}"
    local_opt = {}
    local_opt[:path] = File.join(File.expand_path('../gems', __FILE__), nm_gem)
    unless File.directory? local_opt[:path]
      puts "cannot find local gem #{local_opt[:path]}"
      exit 1
    end
    gem nm_gem, local_opt
  else
    local_opt = opt_gem.clone
    gem nm_gem, local_opt
  end
end

source :rubygems

# language
gex "ampex"

# irb
gex "wirble"
gex "interactive_editor"
gex "bosonson"
gex "awesome_print"

# packaging
gex "80ae2fe5c929b7d0a00bdee2d710fa9e"
gex "private_event"
gex "sous"

# configuration
gex "microwave"
gex "tvd-bundler"
gex "tvd-git"
gex "tvd-rubygems"
gex "tvd-ssh"
gex "tvd-dmg"

# deploy
gex "alpha_omega"

# documentation
gex "rtfmd"
gex "showoff"
gex "rocco"
gex "jekyll"

# servers
gex "sinatra"
gex "thin"

# vim: set ft=ruby:
