require 'assets_deployer/asset_file'

module AssetsDeployer
  class Deployer
    def initialize(storage:, root_path:, prefixes:)
      @storage = storage
      @root_path = root_path
      @prefixes = prefixes
    end

    def run
      @storage.upload(files)
    end

    private

    def files
      @files ||= @prefixes.flat_map do |prefix|
        Dir.glob(@root_path.join(prefix).join('**', '**')).map do |path|
          AssetFile.new(prefix, path) if Pathname.new(path).file?
        end
      end.compact
    end
  end
end
