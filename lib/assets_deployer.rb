require 'assets_deployer/deployer'
require 'assets_deployer/configuration'
require 'assets_deployer/storage_builder'

module AssetsDeployer
  def self.run
    deployer = Deployer.new(
      storage: storage,
      root_path: config.assets.root_path,
      prefix_paths: config.assets.prefix_paths,
      ignore_paths: config.assets.ignore_paths
    )

    deployer.run
  end

  def self.config
    @config ||= Configuration.new
  end

  def self.configure
    yield config
  end

  def self.storage
    builder = StorageBuilder.new(
      platform: config.storage.platform,
      name: config.storage.name,
      credentials: config.storage.credentials,
      options: config.storage.options
    )

    builder.build
  end
end

require 'assets_deployer/engine' if defined?(Rails)
