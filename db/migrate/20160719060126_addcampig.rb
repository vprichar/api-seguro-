class Addcampig < ActiveRecord::Migration
  def change
  	add_column :campaigns, :open, :integer
  end
end
