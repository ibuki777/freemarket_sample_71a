class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :order_day, null:false
      t.integer :order_price, null:false
      t.string :shipping_address,null:false
      t.string :exhibiting
      t.string :sold
      t.references :product,null:false,foreign_key: true
      t.references :user,null:false,foreign_key: true
      t.timestamps
    end
  end
end
