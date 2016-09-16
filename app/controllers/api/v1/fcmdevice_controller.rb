module Api
  module V1
class FcmdeviceController < ApplicationController
	respond_to :json
	def index
         respond_with data: { :status => 'ok' ,:Customer => Customer.all }
  end


  def show
    device=  Device.new 
       fcm = params[:fcm_token]
       usertoken = params[:usertoken]

        if Customer.find_by_usertoken(usertoken)  == nil 
         render json: { :status =>  'error'}
       else 
        tem = Customer.find_by_usertoken(usertoken)
        tem.device.iddevices = fcm
        tem.save 
        render json: { :status =>  'ok' , :fcm => tem.name}

       end 

       
  end

  def likcot
     render json: { :status =>  'ok' , :fcm => "hola"}
  end



    def fcm 
       device=  Device.new 
       fcm = params[:fcm_token]
       usertoken = params[:usertoken]

        if Customer.find_by_usertoken(usertoken)  == nil 
         render json: { :status =>  'error'}
       else 
        tem = Customer.find_by_usertoken(usertoken)
        tem.device.iddevices = fcm
        tem.save 
        render json: { :status =>  'ok'}

       end 



    	
    	
      end 

  end
 end 
end 
