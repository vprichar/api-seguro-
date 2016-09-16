class Campaign < ActiveRecord::Base
	validates :name, :presence => true
	validates :body, :presence => true
	has_many :datums


	


	
	          #datum



	  
end
