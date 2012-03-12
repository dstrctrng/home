#!/usr/bin/env ruby

require 'yaml'
require 'json'
require 'alpha_omega/deploy'

set :home, (ENV['REMOTE_HOME'] || ENV['HOME'])

set :repository, "git@github.com:HeSYINUvSBZfxqA/badonkadonk.git"
set :application, "badonkadonk"
set :releases, [ ]
set :deploy_to, home

set :user, "defn"
set :group, "defn"

set :root_user, "defn"
set :root_group, "defn"

# misc
set :use_sudo, false
set :dir_perms, "0750"

# ruby
set :ruby_loader, "rvmrun ree"
set :bundler_options, "--path vendor/bundle"

# os x
if %x(uname -s).strip == "Darwin" && home == ENV['HOME']
  task :gecode_build do
    run "[[ -x #{home}/local/bin/sat ]] || { cd #{home}/build && ./build-gecode; }"
  end

  after "deploy:update_code", "gecode_build"
end

# branch
set :branch, AlphaOmega.what_branch

# pods
AlphaOmega.setup_pods self, "/data/zendesk_chef"

# build
task :git_remote do
  # workaround git clone and non-empty directories
  run "[[ -d .git ]] || { git init && git remote add origin #{repository}; }"
end
after "deploy:bootstrap_code", "git_remote"

task :vim_build do
  run "vim -E -c ':source .vimrc' -c :quit meh"
end
after "deploy:update_code", "vim_build"

