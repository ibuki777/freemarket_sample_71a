class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :name, {presence:true,length: {maximum:40}}
  
  belongs_to_active_hash :category
  belongs_to :brand
  has_many :images, dependent: :destroy
end
