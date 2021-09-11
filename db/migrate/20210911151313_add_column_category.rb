class AddColumnCategory < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :imagen, :string
  end
end
