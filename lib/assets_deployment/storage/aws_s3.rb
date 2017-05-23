require 'aws-sdk'

module AssetsDeployment
  module Storage
    class AwsS3 < Base
      def initialize(credentials:, region: nil, bucket: nil, prefix_key: nil)
        @credentials = credentials
        @bucket = bucket
        @prefix_key = prefix_key
        @region = region || ENV['AWS_REGION']
      end

      def upload(files)
        files.each do |file|
          client.put_object(bucket: @bucket, key: [@prefix_key, file.key].compact.join('/'), body: file.body)
        end
      end

      private

      def client
        @client ||= Aws::S3::Client.new(client_options)
      end

      def client_options
        hash = {}
        hash[:credentials] = credentials
        hash[:region] = @region if @region
        hash
      end

      def credentials
        if !access_key_id&.empty? && !secret_access_key&.empty?
          Aws::Credentials.new(access_key_id, secret_access_key)
        else
          Aws::InstanceProfileCredentials.new
        end
      end

      def access_key_id
        @credentials[:access_key_id] || ENV['AWS_ACCESS_KEY_ID']
      end

      def secret_access_key
        @credentials[:secret_access_key] || ENV['AWS_SECRET_ACCESS_KEY']
      end
    end
  end
end
