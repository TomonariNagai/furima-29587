class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
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
    Payjp.api_key = "sk_test_6339c1ac0d3d22dda2dc143c"
    Payjp::Charge.create(
      amount: @item.price,
      card: delivery_params[:token],
      currency: 'jpy'
    )
  end
end
