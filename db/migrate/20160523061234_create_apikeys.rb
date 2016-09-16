class CreateApikeys < ActiveRecord::Migration
  def change
    create_table :apikeys do |t|
    t.string :access_token
    t.timestamps
    end
  end
end
