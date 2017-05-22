module AssetsDeployment
  class Configuration
    attr_accessor :storage,
                  :assets_root_path,
                  :assets_prefixes

    class StorageConfiguration < Struct.new(:platform, :name, :credentials, :options)
      def initialize
        self.credentials = {}
        self.options = {}
      end
    end

    def storage
      @storage ||= StorageConfiguration.new
    end
  end
end
