module Api
  module V1
    class ItemsController < ApiController
      def index
        respond_with Item.all, serializer: ItemSerializer
      end
    end
  end
end
