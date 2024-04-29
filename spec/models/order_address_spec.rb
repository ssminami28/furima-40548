require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end
  describe '商品の購入' do
    context '商品の購入に成功' do
      it 'tokenを含む必須の項目が全て入力されていれば購入できる' do
        expect(@order_address).to be_valid
      end
      it '建物名の入力が空でも購入できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end
    context '商品の購入に失敗' do
      it '郵便番号が空では購入できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Post code can't be blank"
      end
      it '都道府県が選択されていないと購入できない' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Prefecture can't be blank"
      end
      it '都道府県に「---」が選択されていると購入できない' do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Prefecture can't be blank"
      end
      it '市区町村が空では購入できない' do
        @order_address.city_name = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "City name can't be blank"
      end
      it '番地が空では購入できない' do
        @order_address.block_name = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Block name can't be blank"
      end
      it '電話番号が空では購入できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number can't be blank"
      end
      it '郵便番号が全角文字では購入できない' do
        @order_address.post_code = '１２３-４５６'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Post code is invalid'
      end
      it '電話番号が全角文字では購入できない' do
        @order_address.phone_number = '０９０１２３４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone number is invalid'
      end
      it '電話番号は数字以外が含まれていると購入できない' do
        @order_address.phone_number = 'abcd2345678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone number is invalid'
      end
      it '電話番号が少ないと購入できない' do
        @order_address.phone_number = '09092511'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone number is invalid'
      end
      it '電話番号が長いと購入できない' do
        @order_address.phone_number = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone number is invalid'
      end
      it '郵便番号が正しくないと購入できない' do
        @order_address.post_code = '1234-56'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Post code is invalid'
      end
      it 'tokenが空では購入できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Token can't be blank"
      end
      it 'ユーザーが紐付いていないと購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "User can't be blank"
      end
      it '商品が紐付いていないと購入できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end
