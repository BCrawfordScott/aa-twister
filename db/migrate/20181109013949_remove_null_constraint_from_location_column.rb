class RemoveNullConstraintFromLocationColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :location_id, :integer, null: true
  end
end
