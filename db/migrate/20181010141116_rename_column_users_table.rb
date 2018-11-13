class RenameColumnUsersTable < ActiveRecord::Migration[5.2]
  def change
    rename_column(:users, :lotion_id, :location_id)
  end
end
