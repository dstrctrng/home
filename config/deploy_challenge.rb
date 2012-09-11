set :reviewed, nil

namespace :deploy do
  task :challenge do
    if dna["app_env"] == "production" || true
      who = Capistrano::CLI.ui.ask(" -- Who has reviewed this deploy to #{dna["app_env"]}? ")
      if who.empty?
        abort
      else
        set :reviewed, who
        sleep 3
      end
    end if reviewed.nil?
  end
end

before "deploy:bootstrap_code", "deploy:challenge"
