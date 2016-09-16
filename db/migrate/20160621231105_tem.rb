class Tem < ActiveRecord::Migration
  def change
  	 add_column :insurances, :insured_name, :string

  end
end
