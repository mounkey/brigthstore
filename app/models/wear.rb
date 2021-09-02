class Wear < ApplicationRecord
  belongs_to :category
  has_many :order_items
  validates :talla, presence: true
  validates :color, presence: true
  validates :marca, presence: true
  validate :valor, presence: true
end
