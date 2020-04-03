class Card < ApplicationRecord
  require "payjp"
  Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
  
  belongs_to :user
  validates :user_id, :payjp_id, presence: true
end
