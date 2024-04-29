class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city_name, :block_name, :building_name, :phone_number, :order, :item_id, :user_id,
                :token

  validates :token, presence: true
  validates :post_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :prefecture_id, presence: true
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city_name, presence: true
  validates :block_name, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{11}\z/ }

  def save
    order = Order.create(user_id:, item_id:)
    Address.create(post_code:, prefecture_id:, city_name:, block_name:,
                   building_name:, phone_number:, order_id: order.id)
  end
end
