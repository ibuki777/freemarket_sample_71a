require 'rails_helper'
describe Product do
  describe '#create' do
    it "saves data of activehash" do
      product = build(:product)
      product.valid?
    end
    it "商品名を入力してください" do
      product = Product.new
      product.valid?
    end
    it "商品説明を入力してください" do
      product = Product.new
      product.valid?
    end
    it "商品の値段を入力してください" do
      product = Product.new
      product.valid?
    end
  end
end