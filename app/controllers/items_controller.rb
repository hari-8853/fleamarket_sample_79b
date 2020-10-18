class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @item.images.build
  end

  
  def create
    @item = item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def item_params
    params.require(:item).permit(:name, :price, :item_condition_id, :postage_payer_id, :postage_type_id, :preparation_day_id, images_attributes: [:src])
  end

end

