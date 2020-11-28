class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_delivery = PurchaseDelivery.new
  end

  def new
  end

  def create
    @purchase_delivery = PurchaseDelivery.new(delivery_params)
      if @purchase_delivery.valid?
        @purchase_delivery.save
        redirect_to action: :index
      else
        render action: :index
      end
  end

  private

  def delivery_params
    params.require(:purchase_delivery).permit(:postal_code, :prefecture_id, :municipality, :house_num, :building, :phone_num).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
