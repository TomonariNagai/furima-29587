class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:show, :edit]
  
  def index
    @items = Item.all.order("created_at DESC")
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
  end

  def create
    item = Item.new(item_params)
    if item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      redirect_to item_path(item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :condition_id, :shipping_fee_id, :shipping_from_id, :shipping_date_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
