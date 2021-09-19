class Order < ApplicationRecord
  belongs_to :user, optional: true

  has_one :order_detail, dependent: :destroy
  has_many :order_items, dependent: :destroy
  has_many :wears, through: :order_items

  enum status: %i[initialized pending confirmed]
  # order.initialized! = setear status nuevo (order.pending!)
  # order.pending? = preguntar el status, => true o false

  #after_create_commit :update_order_subtotal
  #after_update_commit :update_order_subtotal

  private

  def update_order_subtotal
    monto_total = self.order_items.sum(:total_price)
    update(mont: monto_total)
  end
end
