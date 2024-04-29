require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end
  describe '商品の購入' do
    context '商品の購入に成功' do
      it 'tokenを含む必須の項目が全て入力していたら購入できる' do
        expect(@order_address).to be_valid
      end
      it '建物名が空である' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end
    context '商品の購入に失敗' do
      it '郵便番号が空である' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Post code can't be blank"
      end
      it '都道府県が選択されてない' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Prefecture can't be blank"
      end
      it '市区町村が空である' do
        @order_address.city_name = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "City name can't be blank"
      end
      it '番地が空である' do
        @order_address.block_name = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Block name can't be blank"
      end
      it '電話番号が空である' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number can't be blank"
      end
      it '郵便番号が半角文字でない' do
        @order_address.post_code = '１２３-４５６'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Post code is invalid. Include hyphen(-)'
      end
      it '電話番号が半角文字でない' do
        @order_address.phone_number = '０９０１２３４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone number is invalid'
      end
      it '電話番号は数字だけ' do
        @order_address.phone_number = 'abcd2345678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone number is invalid'
      end
      it '電話番号が少ない' do
        @order_address.phone_number = '09092511'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone number is invalid'
      end
      it '電話番号が長い' do
        @order_address.phone_number = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone number is invalid'
      end
      it '郵便番号が正しくない' do
        @order_address.post_code = '1234-56'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Post code is invalid. Include hyphen(-)'
      end
      it 'tokenが空では登録できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Token can't be blank"
      end
    end
  end
end
