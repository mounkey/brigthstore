class OrderItem < ApplicationRecord
  belongs_to :wear
  belongs_to :order

  validates :price, presence: true
  validates :cantidad, presence: true

  #after_create_commit :update_total_price
  after_commit :update_total_price

  private

  def update_total_price
    self.total_price = self.price * self.cantidad
  end
end
