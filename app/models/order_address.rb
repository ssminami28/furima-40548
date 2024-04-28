class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city_name, :block_name, :building_name, :phone_number, :order, :item_id, :user_id
  
  validates :post_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :phone_number, presence: true, format: { with: /\A\d{11}\z/ }
  
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city_name: city_name, block_name: block_name, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end