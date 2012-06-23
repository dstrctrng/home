# start local gems handling
shome = File.expand_path('..', __FILE__)
alias :gex :gem
def gem (nm_gem, opt_gem = {})
  shome = File.expand_path('..', __FILE__)
  gem_info = File.join(shome, ".local", nm_gem)
  if File.exists? gem_info
    local_opt = { :path => File.read(gem_info).strip }
    unless File.directory? local_opt[:path]
      puts "cannot find local gem #{local_opt[:path]}"
      exit 1
    end
    gex nm_gem, local_opt
  else
    gex nm_gem, opt_gem.clone
  end
end
source "http://localhost:9292" if Dir[File.join("#{shome}", ".local", "*")].length > 0 
# end local gems

source :rubygems

# irb
gem "wirble"
gem "interactive_editor"
gem "awesome_print"

# git
gem "pre-commit"

# gems
gem "geminabox"

# configuration
gem "tvd-bundler"
gem "tvd-git"
gem "tvd-rubygems"
gem "tvd-ssh"
gem "tvd-dmg"

# secrets
gem "80ae2fe5c929b7d0a00bdee2d710fa9e"

# vim: set ft=ruby:
