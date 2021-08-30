class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :monto
      t.date :fecha
      t.string :metodopago
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.integer :user_id

      t.timestamps
    end
  end
end
