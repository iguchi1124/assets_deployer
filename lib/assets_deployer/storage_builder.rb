require 'assets_deployer/storage/base'
require 'assets_deployer/storage/aws_s3'

module AssetsDeployer
  class StorageBuilder
    class InvalidStorageError < StandardError
    end

    def initialize(name:, credentials:, options:)
      @name = name
      @credentials = credentials
      @options = options
    end

    def build
      case @name
      when 'S3'
        Storage::AwsS3.new(
          credentials: @credentials,
          bucket: @options[:bucket],
          prefix_key: @options[:prefix_key],
          region: @options[:region]
        )
      else
        raise InvalidStorageError
      end
    end
  end
end
