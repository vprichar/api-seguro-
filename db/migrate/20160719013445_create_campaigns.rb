class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :name
      t.text :body
      t.integer :sent
      t.integer :successful
      t.integer :error

      t.timestamps null: false
    end
  end
end
