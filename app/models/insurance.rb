class Insurance < ActiveRecord::Base
	  belongs_to :customer
	  #belongs_to :person, class_name: "Customer", inverse_of: :received_messages

end
