class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    user_validate
    item_validate
    @purchase_delivery = PurchaseDelivery.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_delivery = PurchaseDelivery.new(delivery_params)
      if @purchase_delivery.valid?
        pay_item
        @purchase_delivery.save
        redirect_to root_path
      else
        render action: :index
      end
  end

  private

  def delivery_params
    params.require(:purchase_delivery).permit(:postal_code, :prefecture_id, :municipality, :house_num, :building, :phone_num).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: delivery_params[:token],
      currency: 'jpy'
    )
  end

  def user_validate
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def item_validate
    if @item.purchase.present?
      redirect_to root_path
    end
  end
end
