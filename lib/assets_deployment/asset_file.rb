module AssetsDeployment
  class AssetFile
    attr_reader :prefix

    def initialize(prefix, path)
      @prefix = prefix
      @path = path
    end

    def key
      [prefix, File.basename(@path)].join('/')
    end

    def body
      File.new(@path)
    end
  end
end
