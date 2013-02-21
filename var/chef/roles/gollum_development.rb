name "gollum_develop"
description "The develop overrides for a gollum unicorn"
run_list "role[gollum]"
override_attributes(
  :project_dir => "#{Dir.pwd}/var",
  :release_dir => "#{Dir.pwd}/var"
)
