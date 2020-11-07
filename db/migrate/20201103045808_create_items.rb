class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :text
      t.integer :category_id
      t.integer :condition_id
      t.integer :shipping_fee_id
      t.integer :shipping_from_id
      t.integer :shipping_date_id
      t.integer :price
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
