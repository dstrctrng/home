node.default[:project_dir] = ENV['PWD']
node.default[:app_env] = "development"
node.default[:user] = { :name => "Tom Bombadil", :email => "amanibhavam@destructuring.org" }

include_recipe "badonkadonk"
