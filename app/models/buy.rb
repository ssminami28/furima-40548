class Buy < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :price, presence: true
end
