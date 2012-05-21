name "shell"
description "shell"
rl = %w(git bundler rubygems ssh::client)
if %x(uname -s).strip == "Darwin"
  #rl += %w(tunnelblick virtualbox gitx)
end
run_list rl
