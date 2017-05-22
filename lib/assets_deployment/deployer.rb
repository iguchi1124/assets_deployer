require 'assets_deployment/asset_file'

module AssetsDeployment
  class Deployer
    def initialize(storage:, root_path:, prefixes:)
      @storage = storage
      @root_path = root_path
      @prefixes = prefixes
    end

    def run
      @storage.upload(files)
    end

    def files
      @files ||= @prefixes.flat_map do |prefix|
        Dir.glob(@root_path.join(prefix).join('**', '**')).map do |path|
          AssetFile.new(prefix, path) if Pathname.new(path).file?
        end
      end.compact
    end
  end
end
