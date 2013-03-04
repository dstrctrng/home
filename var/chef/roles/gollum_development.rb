name "gollum_develop"
description "The develop overrides for a gollum unicorn"
run_list "role[gollum]"
override_attributes(
  :project_dir => "#{ENV['RELEASE_DIR']}/var",
  :release_dir => "#{ENV['PROJECT_DIR']}/var"
)
