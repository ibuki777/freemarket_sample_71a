require 'rails_helper'

describe Address do
  describe '#create' do

    it "必須事項があれば登録できる" do
      address = build(:address)
      expect(address).to be_valid
    end

    it "姓なしでは無効" do
      address = build(:address, last_name: nil)
      address.valid?
      expect(address.errors[:last_name]).to include("を入力してください")
    end

    it "姓は全角であれば登録" do
      address = build(:address, last_name: "あべ")
      address.valid?
      expect(address).to be_valid
    end

    it "姓は全角でなければ無効" do
      address = build(:address, last_name: "abe")
      address.valid?
      expect(address.errors[:last_name]).to include("は不正な値です")
    end


    it "姓かななしでは無効" do
      address = build(:address, last_name_kana: nil)
      address.valid?
      expect(address.errors[:last_name_kana]).to include("を入力してください")
    end

    it "姓かなは全角ひらがなであれば登録" do
      address = build(:address, last_name_kana: "ひろし")
      address.valid?
      expect(address).to be_valid
    end

    it "姓かなは全角でなければ無効" do
      address = build(:address, last_name_kana: "hiroshi")
      address.valid?
      expect(address.errors[:last_name_kana]).to include("は不正な値です")
    end

    it "姓かなは全角ひらがなでなければ無効" do
      address = build(:address, last_name_kana: "アベ")
      address.valid?
      expect(address.errors[:last_name_kana]).to include("は不正な値です")
    end


    it "名なしでは無効" do
      address = build(:address, first_name: nil)
      address.valid?
      expect(address.errors[:first_name]).to include("を入力してください")
    end

    it "名は全角であれば登録" do
      address = build(:address, first_name: "ひろし")
      address.valid?
      expect(address).to be_valid
    end

    it "名は全角でなければ無効" do
      address = build(:address, first_name: "hiroshi")
      address.valid?
      expect(address.errors[:first_name]).to include("は不正な値です")
    end


    it "名かななしでは無効" do
      address = build(:address, first_name_kana: nil)
      address.valid?
      expect(address.errors[:first_name_kana]).to include("を入力してください")
    end

    it "名かなは全角ひらがなであれば登録" do
      address = build(:address, first_name_kana: "ひろし")
      address.valid?
      expect(address).to be_valid
    end

    it "名かなは全角でなければ無効" do
      address = build(:address, first_name_kana: "hiroshi")
      address.valid?
      expect(address.errors[:first_name_kana]).to include("は不正な値です")
    end

    it "名かなは全角ひらがなでなければ無効" do
      address = build(:address, first_name_kana: "アベ")
      address.valid?
      expect(address.errors[:first_name_kana]).to include("は不正な値です")
    end


    it "郵便番号なしでは無効" do
      address = build(:address, zip_code: nil)
      address.valid?
      expect(address.errors[:zip_code]).to include("を入力してください")
    end

    it "市区町村なしでは無効" do
      address = build(:address, city: nil)
      address.valid?
      expect(address.errors[:city]).to include("を入力してください")
    end

    it "番地なしでは無効" do
      address = build(:address, address: nil)
      address.valid?
      expect(address.errors[:address]).to include("を入力してください")
    end

    it "都道府県なしでは無効" do
      address = build(:address, prefecture_id: nil)
      address.valid?
      expect(address.errors[:prefecture_id]).to include("を入力してください")
    end
  end
end