require 'new_relic/recipes'
require 'airbrake'
require 'airbrake_tasks'
require 'capistrano/campfire'

namespace :deploy do
  namespace :notify do
    task :default do
      airbrake
      newrelic
      email
      campfire
    end

    task :email do
      run_locally "echo '#{notify_message}' | mail -s '#{notify_message}' #{$deploy["notify"]["email"]["recipients"].join(" ")}"
    end

    task :campfire do
      set :campfire_options, 
            :ssl => true,
            :account => $deploy["notify"]["campfire"]["account"],
            :room => $deploy["notify"]["campfire"]["room"],
            :email => $deploy["notify"]["campfire"]["email"],
            :token => $deploy["notify"]["campfire"]["token"]

      begin 
        campfire_room.speak notify_message
      rescue
        $stderr.puts "Campfire announcement failed"
      end
    end

    task :airbrake do
      Airbrake.configure do |config|
        config.api_key = $deploy["notify"]["airbrake"]["api_key"]
      end
      
      begin
        AirbrakeTasks.deploy({
          :rails_env      => dna['app_env'],
          :scm_revision   => current_revision,
          :scm_repository => repository,
          :local_username => ENV['AO_USER']
        })
      rescue EOFError
        $stderr.puts "An error occurred during the Airtoad deploy notification."
      end
    end

    task :newrelic do
    end

    def notify_message
      "#{ENV['AO_USER']} deployed #{application} (#{current_revision}@#{repository}) to #{dna['app_env']}"
    end 
  end
end

after "deploy:restart", "deploy:notify"
