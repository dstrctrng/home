namespace :microwave do
  task :cook do
    run "cd #{deploy_release} && #{ruby_loader} bin/microwave -n #{dna["node_env"] || dna["app_env"]}"
  end
end

# suggested hook placement
# after "deploy:cook", "microwave:cook"
