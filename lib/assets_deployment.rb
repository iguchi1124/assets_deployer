require 'assets_deployment/deployer'
require 'assets_deployment/configuration'
require 'assets_deployment/storage_builder'

module AssetsDeployment
  def self.run
    deployer = Deployer.new(storage: storage, root_path: config.assets_root_path, prefixes: config.assets_prefixes)
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

require 'assets_deployment/engine' if defined?(Rails)
