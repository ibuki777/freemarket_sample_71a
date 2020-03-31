class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :user_id, :product_id, :address_id, presence: true
end
