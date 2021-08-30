class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.integer :wear_id
      t.integer :order_id
      t.integer :price
      t.integer :cantidad

      t.timestamps
    end
  end
end
