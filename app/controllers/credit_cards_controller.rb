class CreditCardsController < ApplicationController
  require 'payjp'

  def new
    card = CreditCard.where(user_id: current_user.id)
    redirect_to action: "show" if card.exists?
  end

  def pay
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  end

  def show

  end
  

  def destroy

  end
end
