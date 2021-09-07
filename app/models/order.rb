class Order < ApplicationRecord
  belongs_to :user

  has_many :order_items, dependent: :destroy
  has_many :wears, through: :order_items


  validates :monto, presence: true
  validates :metodopago, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :country, presence: true
  validates :address, presence: true
end
