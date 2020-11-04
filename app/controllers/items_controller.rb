class ItemsController < ApplicationController
  def index
    @items = Item.includes(:image).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.images.build
  end

  def show
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
    params.require(:item).permit(:name, :introduction, :category_id, :price, :brand, :item_condition_id, :postege_payer_id, :postage_tyep_id, :preparation_day_id, images_attributes: [:url])
  end

end

