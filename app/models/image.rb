class Image < ApplicationRecord
  validates :image,{presence:{message: "を選択してください"}}
  belongs_to :product、
  # mount_uploader :image, ImageUploader
end
