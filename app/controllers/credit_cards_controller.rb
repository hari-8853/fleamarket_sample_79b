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
  

  def delete
    card = CreditCard.find_by(user_id: current_user.id)
    if card.blank?
    else
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end

  def show #Cardのデータpayjpに送り情報を取り出します
    card = CreditCard.find_by(user_id: current_user.id)
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
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
end
