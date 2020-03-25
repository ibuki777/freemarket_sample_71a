class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :zip_code, :city, :address, :prefecture_id, presence: true
  validates :last_name, :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :last_name_kana, :first_name_kana, presence: true, format: { with: /\A[ぁ-んー－]+\z/}


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

end
