require 'rails_helper'

describe Card do
  describe '#create' do
  
    it "user_id, payjp_idがあれば保存できる" do
      card = build(:card)
      expect(card).to be_valid
    end

    # it "user_id がないと保存できない。" do
    #   card = build(:card, user_id: nil)
    #   card.valid?
    #   expect(card.errors[:user_id]).to include("を入力してください")
    # end
  end


end