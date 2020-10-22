require 'rails_helper'

describe Item do
  describe '#create' do

    it "イメージが空だと保存できない" do
      # images = build(:item, images: "")
      @item = build(:item_no_image)
      @item.valid?
      expect(@item.errors[:images]).to include("を入力してください")
    end

    it "商品名が空だと保存できない" do
      @item = build(:item, name: "")
      @item.valid?
      expect(@item.errors[:name]).to include("を入力してください")
    end

    it "商品説明が空だと保存できない" do
      @item = build(:item, introduction: "")
      @item.valid?
      expect(@item.errors[:introduction]).to include("を入力してください")
    end

    it "カテゴリーが空だと保存できない" do
      @item = build(:item, category_id: "")
      @item.valid?
      expect(@item.errors[:category_id ]).to include("を入力してください")
    end

    it "商品状態が空だと保存できない" do
      @item = build(:item, item_condition_id: "")
      @item.valid?
      expect(@item.errors[:item_condition_id ]).to include("を入力してください")
    end

    it "配送料が空だと保存できない" do
      @item = build(:item, postege_payer_id: "")
      @item.valid?
      expect(@item.errors[:postege_payer_id ]).to include("を入力してください")
    end

    it "配送方法が空だと保存できない" do
      @item = build(:item, preparation_day_id: "")
      @item.valid?
      expect(@item.errors[:preparation_day_id ]).to include("を入力してください")
    end

    it "販売価格が空だと保存できない" do
      @item = build(:item, price: "")
      @item.valid?
      expect(@item.errors[:price ]).to include("は数値で入力してください")
    end
  end
end