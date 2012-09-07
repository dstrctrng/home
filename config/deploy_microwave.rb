namespace :microwave do
  task :hack do
    run "[[ -L #{deploy_release}/log ]] || rm -rf #{deploy_release}/log"
  end

  task :cook do
    hack
    run "cd #{deploy_release} && #{ruby_loader} bin/microwave -n #{dna["app_env"]}"
  end
end

# suggested hook placement
# after "deploy:cook", "microwave:cook"
