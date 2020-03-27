class Card < ApplicationRecord
  require "payjp"
  Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
end
