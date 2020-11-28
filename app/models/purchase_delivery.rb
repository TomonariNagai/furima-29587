class PurchaseDelivery 

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :house_num, :building, :phone_num, :user_id, :item_id

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Delivery.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, house_num: house_num, building: building, phone_num: phone_num, purchase_id: purchase.id)
  end
end 