class CreateData < ActiveRecord::Migration
  def change
    create_table :data do |t|
    	t.datetime :data 
    	t.integer  :campaign_id 

      t.timestamps null: false
    end
  end
end
