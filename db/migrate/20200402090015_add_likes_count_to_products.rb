class AddLikesCountToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :likes_count, :integer
    add_column :products, :exhibition_id, :integer
  end
end
