run_list [ 'badonkadonk' ]
platform "generic"
platform_version "0.0.1"

release_dir ENV['PWD']
project_dir ENV['PWD']
home_dir ENV['HOME']
app_env "development"

user({ :name => "Tom Bombadil", :email => "amanibhavam@destructuring.org" })
