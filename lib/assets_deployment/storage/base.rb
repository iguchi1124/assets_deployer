module AssetsDeployment
  module Storage
    class Base
      def upload
        raise NotImplementedError
      end
    end
  end
end
