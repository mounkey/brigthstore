class OrderDetail < ApplicationRecord
  
  t.string :metodopago
  t.string :address
  t.string :city
  t.string :state
  t.string :country
  t.string :address
  t.references :order, foreign_key: true

end
