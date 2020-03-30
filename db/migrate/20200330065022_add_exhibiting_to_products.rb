class AddExhibitingToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :exhibiting, :integer
    add_column :products, :sold, :integer
  end
end
