class BuyersController < ApplicationController
  require 'payjp'
  before_action :set_card, :set_item
  def index
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    if params['payjp_token'].blank?
      redirect_to new_credit_card_path
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
