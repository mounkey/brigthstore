class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    unless ActiveRecord::Base.connection.table_exists? 'orders'
      create_table :orders do |t|
        t.integer :monto
        t.date :fecha
        t.string :metodopago
        t.string :address
        t.string :city
        t.string :state
        t.string :country
        t.references :user, null: false, foreign_key: true

        t.timestamps
      end
    end
  end
end
