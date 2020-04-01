require 'rails_helper'
describe Product do
  describe '#create' do
    it "saves data of activehash" do
      product = build(:product)
      product.valid?
    end
    it "ログイン状態であれば登録できる" do
      user = build(:user,user_id: 1)
      expect(user).to be_valid
    end
    it "ログインしてください" do
      user = build(:user, user_id:"")
      user.valid?
      expect(user.errors[:user_id]).to include("ログインしてください")
    end

    it "商品名なしでは無効" do
      product = build(:product, name: "")
      product.valid?
      expect(product.errors[:name]).to include("を入力または４０字いないで入力してください")
    end
    it "商品名40字以上では無効" do
      product = build(:product, name: 00000000000000000000000000000000000000000)
      product.valid?
      expect(product.errors[:name]).to include("を入力または４０字いないで入力してください")
    end

    it "商品名40文字いないで登録" do
       product = build(:product, name:0000000000000000000000000000000000000000 ) 
       product.valid?
       expect(product).to be_valid
    end
    it "商品説明なしでは無効" do
      product = build(:product, explain: "")
      product.valid?
      expect(product.errors[:explain]).to include("を入力、または1000字以内で入力してください")
    end
    it "1000字以内なら登録" do
      product = build(:product, explain: 1000)
      product.valid?
      expect(product).to be_valid
    end
    it "商品値段なしでは無効" do
      product = build(:product, price: 1000000)
      product.valid?
      expect(product.errors[:price]).to include("300以上999999以下で入力してください")
    end
    it "商品値段300以上100万未満で登録" do
      product = build(:product, price: 300)
      product.valid?
      expect(product).to be_valid
    end
  end
end