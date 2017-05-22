namespace :assets do
  task :deploy do
    AssetsDeployment.run
  end
end
