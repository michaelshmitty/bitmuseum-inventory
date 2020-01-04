class ChangeOwnerIdOnItem < ActiveRecord::Migration[6.0]
  def change
    change_column :items, :owner_id, :integer, null: false
  end
end
