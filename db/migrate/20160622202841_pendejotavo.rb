class Pendejotavo < ActiveRecord::Migration
  def change
  	 add_column :insurances, :emergency, :string
  end
end
