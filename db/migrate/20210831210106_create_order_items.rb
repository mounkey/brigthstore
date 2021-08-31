class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.integer :price
      t.integer :cantidad
      t.references :wear, null: false, foreign_key: true

      t.timestamps
    end
  end
end
