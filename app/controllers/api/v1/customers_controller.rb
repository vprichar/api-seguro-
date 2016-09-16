module Api
  module V1
    class CustomersController < ApplicationController
            respond_to :json 
 
    
      before_filter :restrict_access
      def index

     respond_with data: { :status => 'ok' ,:Customer => Customer.all }


      end

      def show
       if Customer.find_by_usertoken(params[:id])  == nil 
      respond_with data: { :status => 'error '}
       else 

        respond_with data: { :status => 'ok', :Customer => Customer.find_by_usertoken(params[:id]) , :insurance => Customer.find_by_usertoken(params[:id]).insurance.reorder('id DESC') , :insuranceSize => Customer.find_by_usertoken(params[:id]).insurance.count }
      end 
      end

      def create
        respond_with  Customer.create(params[:product])
      end

      def update
        respond_with  Customer.update(params[:id], params[:product])
      end

      def destroy
        respond_with  Customer.destroy(params[:id])
      end
   
    private
    
def restrict_access
        api_key = Apikey.find_by_access_token(params[:access_token])
        if  (api_key)
           head :unauthorized unless api_key 
         else
         render json: { :status => 'Error'}

      end  
      end
      end
  end
end