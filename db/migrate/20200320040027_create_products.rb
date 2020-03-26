class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false,length: {maximum: 40}
      t.text :explain,null: false,length: {maximum: 1000}
      t.integer :price, null: false
      t.integer :category_id, null: false
      t.integer :brand_id
      t.integer :condition_id, null: false
      t.integer :delivery_way_id, null: false
      t.integer :delivery_day_id, null: false
      t.integer :prefecture_id, null: false
      t.references :user, null: false,foreign_key: true
      t.timestamps
    end
  end
end
