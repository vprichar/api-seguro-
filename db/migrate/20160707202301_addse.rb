class Addse < ActiveRecord::Migration
  def change
  	add_column :insurances, :refname , :string
  	add_column :insurances, :features , :string
  end
end
