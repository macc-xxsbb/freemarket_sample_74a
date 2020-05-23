class ItemPaymentsController < ApplicationController

  require "payjp"

  def buy
    @item = Item.find_by(id: params[:format])
    @images = @item.item_images.all
    if user_signed_in?
      @user = current_user
      if @user.credit_card.present?
        Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
        @card = CreditCard.find_by(user_id: current_user.id)
        customer = Payjp::Customer.retrieve(@card.customer_id)
        @customer_card = customer.cards.retrieve(@card.card_id)

        @card_brand = @customer_card.brand
        case @card_brand
        when "Visa"
          @card_src = "visa.svg"
        when "JCB"
          @card_src = "jcb.svg"
        when "MasterCard"
          @card_src = "master.svg"
        when "American Express"
          @card_src = "amex.svg"
        when "Diners Club"
          @card_src = "diners.svg"
        when "Discover"
          @card_src = "discover.svg"
        end

        @exp_month = @customer_card.exp_month.to_s
        @exp_year = @customer_card.exp_year.to_s.slice(2,3)
      else
      end
    else
      redirect_to user_session_path, alert: "ログインしてください"
    end
  end

  def pay
    @item = Item.find(params[:item_id])
    @images = @item.item_images.all

    if @item.buyer_id.present?
      redirect_to item_path(@item.id), alert: "売り切れています。"
    else
        @item.with_lock do
        if current_user.credit_card.present?
          @card = CreditCard.find_by(user_id: current_user.id)
          Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
          charge = Payjp::Charge.create(
          amount: @item.price,
          customer: Payjp::Customer.retrieve(@card.customer_id),
          currency: 'jpy'
          )
          # binding.pry
          @item.buyer_id = current_user.id
          redirect_to root_path
        else
          Payjp::Charge.create(
          amount: @item.price,
          card: params['payjp-token'],
          currency: 'jpy'
          )
          binding.pry
          @item.buyer_id = current_user.id
        end
        @item_payment = ItemPayment.create(buyer_id: current_user.id, item_id: params[:item_id])
        @item = Item.create(buyer_id: current_user.id)
        
        # @item.update(item_params)
      end
    end
  end
  

    private
  
    def item_params
      params.permit(buyer_id: current_user.id)
    end
  
end