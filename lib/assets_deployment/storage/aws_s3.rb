require 'aws-sdk'

module AssetsDeployment
  module Storage
    class AwsS3 < Base
      def initialize(access_key_id: nil, secret_access_key: nil, bucket: nil, prefix_key: nil)
        @access_key_id = access_key_id || ENV['AWS_ACCESS_KEY_ID']
        @secret_access_key = secret_access_key || ENV['AWS_SECRET_ACCESS_KEY']
        @bucket = bucket
        @prefix_key = prefix_key
      end

      def upload(files)
        files.each do |file|
          client.put_object(bucket: @bucket, key: [@prefix_key, file.key].compact.join('/'), body: file.body)
        end
      end

      private

      def client
        @client ||= ::Aws::S3::Client.new(access_key_id: @access_key_id, secret_access_key: @secret_access_key)
      end
   end
  end
end
