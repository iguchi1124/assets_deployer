require 'assets_deployment/storage/base'
require 'assets_deployment/storage/aws_s3'

module AssetsDeployment
  class StorageBuilder
    class InvalidStorageError < StandardError
    end

    def initialize(platform:, name:, credentials:, options:)
      @platform = platform
      @name = name
      @credentials = credentials
      @options = options
    end

    def build
      case [@platform, @name]
      when ['AWS', 'S3']
        Storage::AwsS3.new(
          access_key_id: @credentials[:access_key_id],
          secret_access_key: @credentials[:secret_access_key],
          bucket: @options[:bucket],
          prefix_key: @options[:prefix_key]
        )
      else
        raise InvalidStorageError
      end
    end
  end
end
