class RemoveReferencesFromWears < ActiveRecord::Migration[6.0]
  def change
    remove_reference :wears, :user 
  end
end
