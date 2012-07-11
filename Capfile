#!/usr/bin/env ruby

require 'alpha_omega/deploy'

set :releases, [ ]
set :deploy_to,  (ENV['REMOTE_HOME'] || ENV['HOME'])

set :root_user, "defn"
set :root_group, "defn"

set :use_sudo, false
set :dir_perms, "0750"

set :bundler_options, "--path vendor/bundle"

# build
namespace :git do
  task :bootstrap do
    # workaround git clone and non-empty directories
    run "[[ -d .git ]] || { git init && git remote add origin #{repository}; }"
  end
end

namespace :rvm do
  task :bootstrap do
    run "[[ -d .rvm ]] || { if [[ -d /usr/local/rvm ]]; then ln -nfs /usr/local/rvm .rvm; else true; fi; }"
  end
end

namespace :vim do
  task :bundle do
    run "bin/bundle-vim"
  end
end

after "deploy:bootstrap_code", "git:bootstrap"
after "deploy:bootstrap_code", "rvm:bootstrap"
after "deploy:bundle", "vim:bundle"

# interesting hosts
Deploy self, File.join(File.expand_path('..', __FILE__), "config", "deploy.yml") do |admin, node| 
  { :deploy => { } }
end
