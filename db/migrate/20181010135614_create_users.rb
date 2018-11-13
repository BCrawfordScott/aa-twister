class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.integer :lotion_id, null: false
      t.timestamps
    end
  end
end
