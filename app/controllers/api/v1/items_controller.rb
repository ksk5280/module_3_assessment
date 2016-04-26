module Api
  module V1
    class ItemsController < ApiController
      def index
        respond_with Item.all
      end

      def show
        respond_with Item.find(params[:id])
      end

      def destroy
        respond_with Item.find(params[:id]).delete
      end
    end
  end
end
