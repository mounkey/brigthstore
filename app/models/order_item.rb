class OrderItem < ApplicationRecord
  belongs_to :wear
  belongs_to :order
end
