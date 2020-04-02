class Image < ApplicationRecord
  validates :image, {presence:{message: "を選択してください"}}
  # validates :image, length: {minimum: 1}
  belongs_to :product
  mount_uploader :image, ImageUploader
end
