require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid with all data' do
        expect(build(:order)).to be_valid
      end
    end

    context 'can not save' do
      it 'is invalid without user_id' do
        message = build(:order, user: nil )
        message.valid?
        expect(message.errors[:product_id]).to include("を入力してください")
      end
    end
  end
end
