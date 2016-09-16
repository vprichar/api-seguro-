module Api
  module V1
    class ApikeyController < ApplicationController

      respond_to :json
       before_filter :restrict_access
      
       def new 
       @apikey = Apikey.new
       @apikey.save
       respond_with  data: { :status => 'ok' ,:token => @apikey.access_token }
      end

      


private
    
def restrict_access
    
       fcm = params[:fcm_token]
       usertoken = params[:usertoken]


        if Customer.find_by_usertoken(usertoken)  == nil 

         render json: { :status =>  'error'}
          
       else
       if Customer.find_by_usertoken(usertoken).device ==  nil
         device=  Device.new 

       else 
        device = Customer.find_by_usertoken(usertoken).device

       end 

        device.iddevices = fcm
       tem =  Customer.find_by_usertoken(usertoken).device = device
       tem.save 


        head :unauthorized unless true
          
       
      end 
      end
      end
  end
end