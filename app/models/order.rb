class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user
  belongs_to :address

  validates :user_id, :product_id, :address_id, presence: true
end
