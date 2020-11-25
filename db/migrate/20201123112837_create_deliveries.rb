class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string :postal_code
      t.integer :prefecture_id
      t.string :municipality
      t.string :house_num
      t.string :building
      t.string :phone_num
      t.references :purchase, foreign_key: true
      t.timestamps
    end
  end
end
