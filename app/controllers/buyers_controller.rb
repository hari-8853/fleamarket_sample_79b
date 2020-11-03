class BuyersController < ApplicationController
  require 'payjp'
  before_action :set_card, :set_item
  def index
  end

  def done
  end

  private

  def set_card
    @card = CreditCard.find_by(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
