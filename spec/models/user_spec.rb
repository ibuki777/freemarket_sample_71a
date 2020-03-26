require 'rails_helper'

describe User do
  describe '#create' do

    it "必須事項があれば登録できる" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "ニックネームなしでは無効" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "メールアドレスなしでは無効" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "重複したメールアドレスは無効" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "パスワードなしでは無効" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "パスワード7文字以上であれば登録" do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user).to be_valid
    end

    it "パスワード6文字以下では無効" do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

    it "確認パスワードが一致しなければ無効" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end


    it "姓なしでは無効" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("を入力してください")
    end

    it "姓は全角であれば登録" do
      user = build(:user, last_name: "あべ")
      user.valid?
      expect(user).to be_valid
    end

    it "姓は全角でなければ無効" do
      user = build(:user, last_name: "abe")
      user.valid?
      expect(user.errors[:last_name]).to include("は不正な値です")
    end


    it "姓かななしでは無効" do
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("を入力してください")
    end

    it "姓かなは全角ひらがなであれば登録" do
      user = build(:user, last_name_kana: "ひろし")
      user.valid?
      expect(user).to be_valid
    end

    it "姓かなは全角でなければ無効" do
      user = build(:user, last_name_kana: "hiroshi")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("は不正な値です")
    end

    it "姓かなは全角ひらがなでなければ無効" do
      user = build(:user, last_name_kana: "アベ")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("は不正な値です")
    end


    it "名なしでは無効" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    it "名は全角であれば登録" do
      user = build(:user, first_name: "ひろし")
      user.valid?
      expect(user).to be_valid
    end

    it "名は全角でなければ無効" do
      user = build(:user, first_name: "hiroshi")
      user.valid?
      expect(user.errors[:first_name]).to include("は不正な値です")
    end


    it "名かななしでは無効" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end

    it "名かなは全角ひらがなであれば登録" do
      user = build(:user, first_name_kana: "ひろし")
      user.valid?
      expect(user).to be_valid
    end

    it "名かなは全角でなければ無効" do
      user = build(:user, first_name_kana: "hiroshi")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は不正な値です")
    end

    it "名かなは全角ひらがなでなければ無効" do
      user = build(:user, first_name_kana: "アベ")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は不正な値です")
    end


    it "生年月日なしでは無効" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("を入力してください")
    end

  end
end