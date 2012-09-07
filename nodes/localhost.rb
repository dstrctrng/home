run_list [ 'role[shell]' ]
platform "generic"
platform_version "0.0.1"

release_dir "#{ENV['HOME']}"
project_dir "#{ENV['HOME']}"
home_dir ENV['HOME']
app_env "development"

app_dir "."

ruby_loader "rvm-exec"

user({ :name => "Tom Bombadil", :email => "amanibhavam@destructuring.org" })
