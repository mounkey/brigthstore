class Wear < ApplicationRecord
  belongs_to :category
  has_many :order_items
  has_one_attached :photo
  validates :talla, presence: true
  validates :color, presence: true
  validates :marca, presence: true
  validates :valor, presence: true
  validates :descripcion, presence: true
end
