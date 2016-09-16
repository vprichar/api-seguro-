class Customer < ActiveRecord::Base
	has_many :insurance
	has_one :device
	validates :name , :presence => true 
	validates :daten, :presence => true
    validates :email, :presence => true
    validates :usertoken, :presence => true
    validates :phone, :presence => true


   
	def to_h

		deviced = false 
             if self.device.nil?
                     deviced =  false 
             else
                      deviced =   true 
             end


		{
			id: self.id,
			name: self.name,
			email: self.email,
			usertoken: self.usertoken,
			phone: self.phone,
			devic: deviced 

		    
			
		}
	end


end


