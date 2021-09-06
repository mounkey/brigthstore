class AddColumnToWearsUserId < ActiveRecord::Migration[6.0]
  def change
    add_column :wears, :user_id, :bigint
  end
end
