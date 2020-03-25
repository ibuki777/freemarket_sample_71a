class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false,length: {maximum: 40}
      t.text :explain,null: false,length: {maximum: 1000}
      t.integer :price, null: false
      t.timestamps
    end
  end
end
