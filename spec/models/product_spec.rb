require 'rails_helper'
describe Product do
  describe '#create' do
    # it "saves data of activehash" do
    #   product = build(:product)
    #   product.valid?
    # end
    it "画像なしは無効" do
      product = build(:product, :with_image)
      product.valid?
      expect(images.errors[:image]).to include("を選択してください")
    end
    it "画像選択は登録" do
      product = build(:product)
      product.valid?
      expect(product).to be_valid
    end
    it "商品名なしでは無効" do
      product = build(:product, name: nil)
      product.valid?
      expect(product.errors[:name]).to include("を入力また40字以内で入力してください")
    end
    it "商品名40字以上では無効" do
      product = build(:product, name: "カ"*100 )
      product.valid?
      expect(product.errors[:name]).to include("を入力また40字以内で入力してください")
    end


    it "商品名40文字いないで登録" do
       product = build(:product, name: "カ"*39 ) 
       product.valid?
       expect(product).to be_valid
    end
    it "商品説明なしでは無効" do
      product = build(:product, explain: nil)
      product.valid?
      expect(product.errors[:explain]).to include("を入力、または1000字以内で入力してください")
    end
    it "1000字以内なら登録" do
      product = build(:product, explain: "a"*1001)
      product.valid?
      expect(product).to be_valid
    end
    it "商品値段なしでは無効" do
      product = build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include("300以上999999以下で入力してください")
    end
    it "300円以下なら無効" do
      product = build(:product, price: 299)
      product.valid?
      expect(product.errors[:price]).to include("300以上999999以下で入力してください")
    end
    it "100万円以上なら無効" do
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