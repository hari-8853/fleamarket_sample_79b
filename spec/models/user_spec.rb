require 'rails_helper'
describe User do
  describe '#create' do
    it "is valid with all data except building_name and phone_number" do
      user = build(:user, building_name: "", phone_number: "")
      expect(user).to be_valid
    end

    it "is invalid without a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "is invalid without a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "is invalid without a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "is invalid without a password_confirmation" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
    end

    it "is invalid without a first_name" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    it "is invalid without a family_name" do
      user = build(:user, family_name: "")
      user.valid?
      expect(user.errors[:family_name]).to include("を入力してください")
    end

    it "is invalid without a first_name_kana" do
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end

    it "is invalid without a family_name_kana" do
      user = build(:user, family_name_kana: "")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("を入力してください")
    end

    it "is invalid without a birth_date" do
      user = build(:user, birth_date: "")
      user.valid?
      expect(user.errors[:birth_date]).to include("を入力してください")
    end

    it "is invalid without a post_code" do
      user = build(:user, post_code: "")
      user.valid?
      expect(user.errors[:post_code]).to include("を入力してください")
    end

    it "is invalid without a prefecture_code" do
      user = build(:user, prefecture_code: nil)
      user.valid?
      expect(user.errors[:prefecture_code]).to include("を入力してください")
    end

    it "is invalid without a city" do
      user = build(:user, city: "")
      user.valid?
      expect(user.errors[:city]).to include("を入力してください")
    end

    it "is invalid without a house_number" do
      user = build(:user, house_number: "")
      user.valid?
      expect(user.errors[:house_number]).to include("を入力してください")
    end

    it "is valid with more than 7 charactors in password" do
      user = build(:user, password: "1234567", password_confirmation: "1234567")
      expect(user).to be_valid
    end

    it "is invalid too short a password" do
      user = build(:user, password: "123456", password_confirmation: "123456")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it 'is invalid too long a password' do
      user = build(:user, password: 'testtoolong128testtesttoolong128testtesttoolong128testtesttoolong128testtesttoolong128testtesttoolong128testtesttoolong128testtesttoolong128testtesttoolong128testtesttoolong128testtesttoolong128testtesttoolong128testtesttoolong128testtesttoolong128testtesttoolong128testtesttoolong128testtesttoolong128test')
      user.valid?
      expect(user.errors[:password]).to include("は128文字以内で入力してください")
    end
  end
end