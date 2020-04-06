class AddExhibitingToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :exhibition_id, :integer, null: false
  end
end
