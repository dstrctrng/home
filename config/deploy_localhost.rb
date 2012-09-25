def run cmd
  logger.debug "executing locally #{cmd}"
  run_locally cmd
  if $?.to_i != 0
    logger.debug "failed with error code #{$?.to_i >> 8}"
    exit 1
  end
end

namespace :deploy do
  task :localdomain do
    if dna["env_pod"] == "localdomain"
      set :releases, []
      set :deploy_to, %x(pwd).chomp
      set :use_sudo, false
      set :user, %x(id -u -n).chomp
      set :group, %x(id -g -n).chomp
      set :root_user, %x(id -u -n).chomp
      set :root_group, %x(id -g -n).chomp
      set :dir_perms, "0755"
      set :bundler_options, "--path vendor/bundle"
      set :skip_scm, true
    end
  end
end

before "deploy:lock", "deploy:localdomain"
