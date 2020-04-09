class Comment < ApplicationRecord
  # validates :comment, {presence:{message: "の入力がありません"}}

  belongs_to :product
  belongs_to :user
end
