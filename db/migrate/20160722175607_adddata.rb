class Adddata < ActiveRecord::Migration
  def change
  	add_column :campaigns, :direcion, :integer
  	add_column :campaigns, :data, :string
  end
end
