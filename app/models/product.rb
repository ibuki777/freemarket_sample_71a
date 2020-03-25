class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :name, {presence:{message: "を４０字以内で入力してください"},length: {maximum:40}}
  validates :explain, {presence:{message: "を入力、または1000字以内で入力してください"},length: {maximum:1000}}
  validates :price, 
            :numericality => { 
            :greater_than_or_equal_to => 299,
            :less_than_or_equal_to => 1000000,
            :message => '300以上9999999以下で入力してください'
            }
  # belongs_to_active_hash :category
  belongs_to :brand
  has_many :images, dependent: :destroy
end
