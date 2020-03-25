class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :last_name, :first_name, :last_name_kana, :first_name_kana, :zip_code, :city, :address, :prefecture_id, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

end
