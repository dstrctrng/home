#!/usr/bin/env ruby

require 'yaml'
require 'json'
require 'alpha_omega/deploy'

set :repository, "git@github.com:HeSYINUvSBZfxqA/badonkadonk.git"
set :application, "badonkadonk"
set :releases, [ ]
set :deploy_to,  (ENV['REMOTE_HOME'] || ENV['HOME'])

set :user, "defn"
set :group, "defn"

set :root_user, "defn"
set :root_group, "defn"

# misc
set :use_sudo, false
set :dir_perms, "0750"

# ruby
set :ruby_loader, "bin/rvmrun ree"
set :bundler_options, "--path vendor/bundle"

# branch
set :branch, AlphaOmega.what_branch([%r(^)])

# pods
AlphaOmega.setup_pods self, "/data/zendesk_chef" do |adm, n|
  { :app => {} }
end

# build
namespace :git do
  task :bootstrap do
    # workaround git clone and non-empty directories
    run "[[ -d .git ]] || { git init && git remote add origin #{repository}; }"
  end
end

namespace :vim do
  task :bundle do
    run "vim -E -c ':source .vimrc' -c :quit meh"
  end
end

after "deploy:bootstrap_code", "git:bootstrap"
after "deploy:bundle", "vim:bundle"
