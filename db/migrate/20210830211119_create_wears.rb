class CreateWears < ActiveRecord::Migration[6.0]
  def change
    create_table :wears do |t|
      t.integer :category_id
      t.string :talla
      t.string :color
      t.string :description
      t.integer :user_id
      t.string :marca
      t.integer :valor

      t.timestamps
    end
  end
end
