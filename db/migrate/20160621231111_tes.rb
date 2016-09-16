class Tes < ActiveRecord::Migration
  def change
  	  add_column :insurances, :policy, :string
  end
end
