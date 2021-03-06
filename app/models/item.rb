class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :shipping_from
  belongs_to :shipping_date
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end
  with_options numericality: {other_than: 1} do
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :shipping_from_id
    validates :shipping_date_id
  end
end