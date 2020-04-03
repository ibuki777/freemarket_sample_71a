class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates_associated :images, {presence:{message: "を選択してください"}}
  validates :images, presence: true
  validates :name, {presence:{message: "を入力してください"},length:{maximum:40}}
  validates :explain, {presence:{message: "を入力してください"},length: {maximum:1000}}
  validates :price, 
  :numericality => { 
    :greater_than_or_equal_to => 300,
    :less_than_or_equal_to => 999999,
    :message => '300以上999999以下で入力してください'
  }
  validates :burden_id,:condition_id,:category_id,:deliveryday_id,:prefecture_id,{presence:{message: "を選択してください"}}

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :burden
  belongs_to_active_hash :deliveryday
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :brand
  has_one :order
  has_many :images, dependent: :destroy
  has_many :products
  belongs_to :user
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user
end

