run_list %w(role[shell])
platform "generic"
platform_version "0.0.1"
user({ :name => "Tom Bombadil", :email => "amanibhavam@destructuring.org" })
git({ :diff_external => "#{ENV['HOME']}/.helper/git_diff_with_vim" })
