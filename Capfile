#!/usr/bin/env ruby

require 'alpha_omega/deploy'

set :releases, [ ]

set(:deploy_to) { capture("cd ~ && pwd").chomp }

set :root_user, "defn"
set :root_group, "defn"

set :use_sudo, false
set :dir_perms, "0750"

set :bundler_options, "--local --path vendor/bundle"

# application deploy
namespace :git do
  task :bootstrap do
    # workaround git clone and non-empty directories
    run "[[ -d .git ]] || { git init && git remote add origin #{repository}; }"
    run "git remote rm origin && git remote add origin #{repository}"
    run "[[ -d #{destination}/.git ]] || #{git} clone #{verbose} #{variable(:repository)} #{destination}"
    run "git fetch -q && git checkout -q --force #{revision}"
    run "bin/git-renamex HeSYINUvSBZfxqA destructuring"
  end
end

namespace :vim do
  task :bundle do
    run "bin/build vim"
  end
end

# hooks into alpha_omega deploy
after "deploy:bootstrap_code", "git:bootstrap"
after "deploy:bundle", "vim:bundle"

# interesting hosts
Deploy self, __FILE__ do |admin, node| 
  { :deploy => { } }
end

