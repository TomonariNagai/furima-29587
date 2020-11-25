class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def new
  end

  def create
    purchase = Purchase.create(purchase_params)
    Delivery.create(delivery_params(purchase))
    redirect_to action: :index
  end

  private

  def purchase_params
    params.permit().merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def delivery_params(purchase)
    params.permit(:postal_code, :prefecture_id, :municipality, :house_num, :building, :phone_num).merge(purchase_id: purchase.id)
  end
end
