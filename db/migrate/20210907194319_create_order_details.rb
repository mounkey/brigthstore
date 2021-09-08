class CreateOrderDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :order_details do |t|
      t.string :metodopago
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
