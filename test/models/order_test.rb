quire 'rails_helper'

describe Order do
  describe '#create' do
    it "is valid with user_id, product_id, adress_id" do
      order = build(:order)
      expect(order).to be_valid
    end

end