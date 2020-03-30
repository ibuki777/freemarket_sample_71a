class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates_associated :images, {presence:{message: "を選択してください"}}
  validates :images, presence: true
  validates :name, presence:true
  validates :explain, {presence:{message: "を入力、または1000字以内で入力してください"},length: {maximum:1000}}
  validates :price, 
  :numericality => { 
    :greater_than_or_equal_to => 299,
    :less_than_or_equal_to => 1000000,
    :message => '300以上9999999以下で入力してください'
  }
  validates :burden_id,:condition_id,:category_id,:deliveryday_id,:prefecture_id,{presence:{message: "を選択してください"}}

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :burden
  belongs_to_active_hash :deliveryday
  has_many :images
  has_many :products
  accepts_nested_attributes_for :images, allow_destroy: true
end
