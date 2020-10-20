class ItemsController < ApplicationController
  def index
    @items = Item.includes(:image).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.images.build
  end

  
  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def item_params
    params.require(:item).permit(:name, :introduction, :category_id, :price, :brand_id, :item_condition_id, :postege_payer_id, :postage_tyep_id, :category_id, :preparation_day_id, image_attributes: [:src])
  end

end

