class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :daten
      t.string :email
      t.string :usertoken
      t.string :phone

      t.timestamps null: false
    end
  end
end
