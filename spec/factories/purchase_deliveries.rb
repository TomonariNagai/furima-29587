FactoryBot.define do
  factory :purchase_delivery do
    token         {'tok_abcdefghijk00000000000000000'}
    postal_code   {'123-4567'}
    prefecture_id {2}
    municipality  {'新宿区'}
    house_num     {'1-1'}
    building      {'東京ビル'}
    phone_num     {123456789}
  end
end
