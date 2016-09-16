class Addd < ActiveRecord::Migration
  def change
  
  	add_column    :insurances , :customer_id , :integer
  end
end
