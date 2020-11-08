require 'rails_helper'

describe CreditCard do
  describe '#create' do

    it "user_idが無いと登録できない" do
      credit_card = build(:credit_card, user_id: "")
      credit_card.valid?
      expect(credit_card.errors[:user_id]).to include("を入力してください")
    end

    it "customer_idが無いと登録できない" do
      credit_card = build(:credit_card, customer_id: "")
      credit_card.valid?
      expect(credit_card.errors[:customer_id]).to include("を入力してください")
    end

    it "card_idが無いと登録できない" do
      credit_card = build(:credit_card, card_id: "")
      credit_card.valid?
      expect(credit_card.errors[:card_id]).to include("を入力してください")
    end
  end
end