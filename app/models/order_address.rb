class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city_name, :block_name, :building_name, :phone_number, :token

  with_options presence: true do
    validates :token, :city_name, :block_name, :user_id, :item_id
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid' }
  end

  def save
    order = Order.create(user_id:, item_id:)
    Address.create(post_code:, prefecture_id:, city_name:, block_name:,
                   building_name:, phone_number:, order_id: order.id)
  end

  def user
    User.find_by(id: user_id)
  end

  def item
    Item.find_by(id: item_id)
  end
end
