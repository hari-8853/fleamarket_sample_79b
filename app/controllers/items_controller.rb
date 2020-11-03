class ItemsController < ApplicationController
  def index
    @items = Item.includes(:image).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.images.build
    #セレクトボックスの初期値設定
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    @category_parent_array = Category.where(ancestry: nil)
  end
  # 以下全て、formatはjsonのみ
  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    # ここでfind_byを使うことでレディーしか取れてなかった
    @category_children = Category.find(params[:parent_id]).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find(params[:child_id]).children
  end
  
  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      @item.images.build
      render 'new'
    end
  end

  def update
    item.update(trading_status: "売り切れ")
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :category_id, :price, :brand_id, :item_condition_id, :postege_payer_id, :postage_tyep_id, :preparation_day_id, images_attributes: [:url])
  end

end

