namespace :assets do
  task deploy: :environment do
    AssetsDeployer.run
  end
end
