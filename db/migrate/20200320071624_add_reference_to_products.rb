class AddReferenceToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :category,null: false,foreign_key: true
    add_reference :products, :brand,foreign_key: true
    add_reference :products, :condition,null: false,foreign_key: true
    add_reference :products, :delivery_way
  end
end
