class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :last_name, :string, null: false
      t.string :first_name, :string, null: false
      t.string :last_name_kana, :string, null: false
      t.string :first_name_kana, :string, null: false
      t.string :zip_code, null: false
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
