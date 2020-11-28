class PurchaseDelivery 

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :house_num, :building, :phone_num, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "Input correctly"}
    validates :municipality
    validates :house_num
    validates :phone_num, format: {with: /\A[0-9]{,11}\z/, message: "Input correctly"}
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "Select"}

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Delivery.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, house_num: house_num, building: building, phone_num: phone_num, purchase_id: purchase.id)
  end
end 