class CreateFInsurances < ActiveRecord::Migration
  def change
    create_table :f_insurances do |t|
      t.string :name
      t.string :description
      t.string :expiration
      t.string :insured_name
      t.string :policy
      t.string :emergency
      t.string :refname
      t.string   :features

      t.timestamps null: false
    end
  end
end
