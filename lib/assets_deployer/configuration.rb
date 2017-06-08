module AssetsDeployer
  class Configuration
    attr_accessor :assets,
                  :storage

    class AssetsConfiguration < Struct.new(:root_path, :prefix_paths, :ignore_paths)
      def initialize
        self.prefix_paths = ['assets']
        self.ignore_paths = []
      end
    end

    class StorageConfiguration < Struct.new(:name, :credentials, :options)
      def initialize
        self.credentials = {}
        self.options = {}
      end
    end

    def assets
      @assets ||= AssetsConfiguration.new
    end

    def storage
      @storage ||= StorageConfiguration.new
    end
  end
end
