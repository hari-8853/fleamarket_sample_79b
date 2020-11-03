class BuyersController < ApplicationController
  require 'payjp'
  before_action :set_card, :set_item
  def index
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    if params['payjp_token'].blank?
      redirect_to new_credit_card_path
    else
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
      @user = current_user
      @card_brand = @default_card_information.brand

      case @card_brand
      when "Visa"
        @card_image = "visa.png"
      when "JCB"
        @card_image = "jcb.svg"
      when "MasterCard"
        @card_image = "master-card.png"
      when "American Express"
        @card_image = "amex.gif"
      when "Diners Club"
        @card_image = "dinersclub.gif"
      when "Discover"
        @card_image = "discover.gif"
      end
    end
  end

  def pay
    Payjp.api_key =  ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      :amount => @item.price,
      :customer => @card.customer_id,
      :currency => 'jpy',
    )
    redirect_to done_item_buyers_path
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
