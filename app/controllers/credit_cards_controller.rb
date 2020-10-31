class CreditCardsController < ApplicationController
  require 'payjp'

  def new
    card = CreditCard.where(user_id: current_user.id)
    redirect_to action: "show" if card.exists?
  end

  def pay
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    if params['payjp_token'].blank?
      redirect_to action: "new"
      
    else
      customer = Payjp::Customer.create(
        description: '登録テスト',
        
        card: params['payjp_token'],
        metadata: {user_id: current_user.id}
      )
      @card = CreditCard.new(
        user_id: current_user.id,
        customer_id: customer.id,
        card_id: customer.default_card
      )
      
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end

  def show

  end
  

  def destroy

  end
end
