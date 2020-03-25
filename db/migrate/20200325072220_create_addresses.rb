class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :zip_code, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :building
      t.string :phone_number
      t.references :user
      t.references :prefecture
      t.timestamps
    end
  end
end
