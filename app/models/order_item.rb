class OrderItem < ApplicationRecord
  belongs_to :wear
  belongs_to :order

  validates :price, presence: true
  validates :cantidad, presence: true

  #after_create_commit :update_total_price
  #after_update_commit :update_total_price

  private

  def update_total_price
    nprice = self.price * self.cantidad
    self[:total_price] = nprice.to_i
    save!
    #self.update_attribute(total_price, nprice)
  end
end
