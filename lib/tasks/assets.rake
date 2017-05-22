namespace :assets do
  task deploy: :environment do
    AssetsDeployment.run
  end
end
