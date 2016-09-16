class Adddevice < ActiveRecord::Migration
  def change
  	add_column :devices, :customer_id , :integer
  end
end
