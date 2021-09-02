class OrderItem < ApplicationRecord
  belongs_to :wear
  belongs_to :order
  validates :monto, presence: true
  validates :cantidad, presence: true
end
