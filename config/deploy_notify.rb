namespace :deploy do
  namespace :notify do
    task :default do
      unless dna["app_env"] == "development"
        airbrake if $deploy["notify"].member? "airbrake"
        newrelic if $deploy["notify"].member? "newrelic"
        email if $deploy["notify"].member? "email"
        campfire if $deploy["notify"].member? "campfire"
        flowdock if $deploy["notify"].member? "flowdock"
      end
    end

    task :email do
      run_locally "echo '#{notify_message}' | mail -s '#{notify_message}' #{$deploy["notify"]["email"]["recipients"].join(" ")}"
    end

    task :campfire do
      require 'capistrano/campfire'

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
      require 'airbrake'
      require 'airbrake_tasks'

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

    task :flowdock do
      require 'flowdock'

      flow = Flowdock::Flow.new(:api_token => $deploy["notify"]["flowdock"]["api_token"])
                  
      flow.push_to_team_inbox(
        :subject => "Application #{$deploy["application"]} deployed #deploy",
        :content => "Application deployed successfully!", 
        :tags => $deploy["notify"]["flowdock"]["tags"],
        :source => "alpha_omega deployment",
        :from => {
          :address => $deploy["notify"]["flowdock"]["from"]["address"],
          :name => $deploy["notify"]["flowdock"]["from"]["name"]
        },
        :project => $deploy["notify"]["flowdock"]["project"])
    end 

    task :newrelic do
      require 'new_relic/recipes'
    end

    def notify_message
      "#{ENV['AO_USER']} deployed #{application} (#{current_revision}@#{repository}) to #{dna['app_env']}"
    end 
  end
end

after "deploy:restart", "deploy:notify"
