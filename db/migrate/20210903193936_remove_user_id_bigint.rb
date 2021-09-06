class RemoveUserIdBigint < ActiveRecord::Migration[6.0]
  def change
    remove_column :wears, :user_id
  end
end
