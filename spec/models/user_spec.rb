require 'rails_helper'
describe User do
  describe '#create' do
    it "is invalid without a nickname" do
      user = User.new(
        nickname: "",
        email: "kkk@gmail.com",
        password: "1111111",
        # first_name: "a",
        # family_name: "b",
        # first_name_kana: "c",
        # family_name_kana: "d",
        # birth_date: "1995-10-12",
        # post_code: "3270835",
        # prefecture_code: 9,
        # city: "f",
        # house_number: "g",
        # building_name: "g",
        # phone_number: "08000000000"
      )
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end
  end
end