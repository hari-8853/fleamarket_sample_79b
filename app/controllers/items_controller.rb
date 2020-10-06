class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @item.images.new
    @item.build_brand
  end

  def create
    @item = item.new(item_params)
    if @item.save
      redirect_to root_path, notice: "出品しました"
    else
    redirect_to action: "new"
    flash [:alert] = "出品に失敗しました"
    end
  end

end

private
def item_params
  params.require(:item).permit(:name, :introduction, :price, :brand, :item_condition, :postage_pahyer, :preparation_day, :postage_type, :category, :trading_status, :item_images)
end