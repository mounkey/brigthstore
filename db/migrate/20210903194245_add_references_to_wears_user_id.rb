class AddReferencesToWearsUserId < ActiveRecord::Migration[6.0]
  def change
    add_reference :wears, :user, foreign_key: true
  end
end
