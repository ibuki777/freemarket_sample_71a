class Product < ApplicationRecord
  validates :name, {presence:{message: "を４０字以内で入力してください"},length: {maximum:40}}
  validates :explain, {presence:{message: "を入力、または1000字以内で入力してください"},length: {maximum:1000}}

  belongs_to :brand
  belongs_to :category
  has_many :images, dependent: :destroy
end
