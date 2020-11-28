class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]
  def index
    @items = Item.includes(:image).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.images.build
    @category_parent_array = ["---"]
    @category_parent_array = Category.where(ancestry: nil)
  end

  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
  end
  
  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  def show
    @category_id = @item.category_id
    @category_parent = Category.find(@category_id).parent.parent
    @category_child = Category.find(@category_id).parent
    @category_grandchild = Category.find(@category_id)
    @user = User.find(@item.seller_id)
    @images = @item.images
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
  
  def edit
    @item.images.build
  end

  def update
    @item.update(trading_status: "売り切れ")

    if @item.update(item_params)
      redirect_to item_path
    else
      redirect_to edit_item_path
    end
  end

  def destroy
    if @item.seller_id == current_user.id
      @item.destroy
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :name,
      :introduction,
      :category_id,
      :price,
      :brand_id,
      :item_condition_id,
      :postege_payer_id,
      :postage_tyep_id,
      :preparation_day_id,
      images_attributes: [:url,:id, :_destroy]).merge(seller_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end