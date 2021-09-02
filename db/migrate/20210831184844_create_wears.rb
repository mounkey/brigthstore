class CreateWears < ActiveRecord::Migration[6.0]
  def change
    create_table :wears do |t|
      t.string :talla
      t.string :color
      t.string :descripcion
      t.string :marca
      t.integer :valor

      t.timestamps
    end

    add_reference :wears, :category, foreign_key: true
    add_reference :wears, :user, foreign_key: true
  end
end
