run_list [ 'role[shell]' ]
platform "generic"
platform_version "0.0.1"

release_dir "#{ENV['PWD']}"
project_dir "#{ENV['PWD']}"
home_dir ENV['HOME']
app_env "development"

app_dir "."
ruby_loader "rvm-exec"

user({ :name => "Tom the Bombadil", :email => "amanibhavam@destructuring.org" })
