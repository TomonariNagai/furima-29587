require 'rails_helper'

RSpec.describe PurchaseDelivery, type: :model do
  before do 
    @purchase_delivery = FactoryBot.build(:purchase_delivery)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it "全ての値が正しく入力されていれば保存できる" do
        expect(@purchase_delivery).to be_valid
      end

      it "buildingが空でも保存できる" do
        @purchase_delivery.building = nil
        expect(@purchase_delivery).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it "tokenが空だと保存できない" do
        @purchase_delivery.token = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Token can't be blank")
      end

      it "postal_codeが空だと保存できない" do
        @purchase_delivery.postal_code = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Postal code can't be blank")
      end

      it "postal_codeはハイフンを含まないと保存できない" do
        @purchase_delivery.postal_code = '1234567'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Postal code Input correctly")
      end

      it "prefecture_idが1だと保存できない" do
        @purchase_delivery.prefecture_id = 1
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Prefecture Select")
      end

      it "municipalityが空だと保存できない" do
        @purchase_delivery.municipality = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Municipality can't be blank")
      end
      
      it "house_numが空だと保存できない" do
        @purchase_delivery.house_num = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("House num can't be blank")
      end

      it "phone_numが空だと保存できない" do
        @purchase_delivery.phone_num = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Phone num can't be blank")
      end

      it "phone_numが12桁以上だと保存できない" do
        @purchase_delivery.phone_num = 123456789012
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Phone num Input correctly")
      end

      it "phone_numがハイフンを含むと登録できない" do
        @purchase_delivery.phone_num = 123-4567-89
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Phone num Input correctly")
      end
    end
  end
end
