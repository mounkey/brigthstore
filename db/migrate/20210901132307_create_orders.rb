class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :monto
      t.date :date
      t.string :metodopago
      t.string :address
      t.string :city
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
