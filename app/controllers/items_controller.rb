class ItemsController < ApplicationController
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
    @item = Item.find(params[:id])
    @category_id = @item.category_id
    @category_parent = Category.find(@category_id).parent.parent
    @category_child = Category.find(@category_id).parent
    @category_grandchild = Category.find(@category_id)

    @user = User.find(@item.seller_id)
    # @images = Image
    @images = @item.images
    # @image = Image.find(@images)

    @brand_id = @item.brand_id
    @brand = Brand.find(@brand_id)

    @condition_id = @item.item_condition_id
    @condition = ItemCondition.find(@condition_id)

    @postege_payer_id = @item.postege_payer_id
    @postege_payer = PostegePayer.find(@postege_payer_id)

    @postage_tyep_id = @item.postage_tyep_id
    @postage_tyep = PostageTyep.find(@postage_tyep_id)

    @preparation_day_id = @item.preparation_day_id
    @preparation_day = PreparationDay.find(@preparation_day_id)

    # @comment = Comment.new
    # @commentALL = Comment.where(item_id:params[:id])
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
      images_attributes: [:url]).merge(seller_id: current_user.id)
  end
end
