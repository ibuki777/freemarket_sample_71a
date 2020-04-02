class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :birthday, presence: true
  validates :last_name, :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :last_name_kana, :first_name_kana, presence: true, format: { with: /\A[ぁ-んー－]+\z/}
  has_many :addresses
  has_many :orders
  has_many :cards
  has_many :products
  has_many :likes, dependent: :destroy
  has_many :like_products, through: :likes, source: :product

end
