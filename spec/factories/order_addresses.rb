FactoryBot.define do
  factory :order_address do
    post_code { '098-7654' }
    prefecture_id { '7' }
    city_name { '緑区' }
    block_name { 'みどり市1-2-3' }
    building_name { 'みどりマンション502' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
