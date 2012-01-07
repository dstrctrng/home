#!/usr/bin/env ruby

require 'yaml'
require 'json'
require 'socket'
require 'alpha_omega/deploy'

set :home, (ENV['REMOTE_HOME'] || ENV['HOME'])

set :application, "badonkadonk"
set :repository, "git@github.com:HeSYINUvSBZfxqA/badonkadonk.git"
set :deploy_to, home

set :ruby_loader, "rvmrun default"
set :bundler_options, "--path vendor/bundle"

if %x(uname -s).strip == "Darwin" && home == ENV['HOME']
  task :bundler_gecode_options do
    run "#{ruby_loader} bundle config build.dep_selector --with-opt-dir=#{home}/local"
  end

  task :gecode_build do
    run "[[ -x #{home}/local/bin/sat ]] || { cd #{home}/build && ./build-gecode; }"
  end

  before "deploy:bundle", "bundler_gecode_options"
  after "deploy:update_code", "gecode_build"
end

set :releases, [ ]
set :dir_perms, "0750"

set :user, "defn"
set :group, "defn"

set :root_user, "defn"
set :root_group, "defn"

set :use_sudo, false

# branch
set :branch, AlphaOmega.what_branch

task :git_remote do
  # workaround git clone and non-empty directories
  run "[[ -d .git ]] || { git init && git remote add origin #{repository}; }"
end

task :vim_build do
  run "vim -E -c ':source .vimrc' -c :quit meh"
end

after "deploy:bootstrap_code", "git_remote"

after "deploy:update_code", "vim_build"

AlphaOmega.setup_pods self, "/data/zendesk_chef"


