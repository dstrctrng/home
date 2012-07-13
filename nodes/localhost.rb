run_list []
platform "generic"
platform_version "0.0.1"

release_dir "#{ENV['PWD']}"
project_dir "#{ENV['PWD']}"
gconfig_dir "#{ENV['PWD']}/config/development"
home_dir ENV['HOME']
app_env "development"

app_dir "."
ruby_loader "#{ENV['HOME']}/.getting-started/bin/rvmrun"
