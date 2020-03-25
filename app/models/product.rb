class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :name, {presence:true,length: {maximum:40}}
  validates :name, {presence:{message: "を４０字以内で入力してください"},length: {maximum:40}}
  validates :explain, {presence:{message: "を入力、または1000字以内で入力してください"},length: {maximum:1000}}

  belongs_to_active_hash :category
  belongs_to :brand
  has_many :images, dependent: :destroy
end
