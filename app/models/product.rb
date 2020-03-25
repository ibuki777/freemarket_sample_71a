class Product < ApplicationRecord
  validates :name, presence:true,length: {maximum:40}
  
  belongs_to :brand
  belongs_to :category
  has_many :images, dependent: :destroy
end
