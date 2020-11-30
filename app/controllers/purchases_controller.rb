class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    @purchase_delivery = PurchaseDelivery.new
  end

  def create
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

  def set_item
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
    if @item.purchase.present?
      redirect_to root_path
    end
  end
end
