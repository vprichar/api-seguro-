class CreateInsurances < ActiveRecord::Migration
  def change
    create_table :insurances do |t|
      t.string :name
      t.string :Description
      t.string :expiration

      t.timestamps null: false
    end
  end
end
