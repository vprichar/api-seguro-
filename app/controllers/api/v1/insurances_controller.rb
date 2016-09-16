module Api
  module V1
    class InsurancesController < ApplicationController

      respond_to :json
      before_filter :restrict_access
      def index
        respond_with  Insurance.all
      end

      def show
        respond_with  Insurance.find(params[:id])
      end

      def create
        respond_with  Insurance.create(params[:product])
      end

      def update
        respond_with  Insurance.update(params[:id], params[:product])
      end

      def destroy
        respond_with  Insurance.destroy(params[:id])
      end

 private

  
      def restrict_access
        api_key = Apikey.find_by_access_token(params[:access_token])
        head :unauthorized unless api_key
      end
      end
  end
end