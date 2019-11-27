class AddNullConstraintToItemCategory < ActiveRecord::Migration[6.0]
  def change
    change_column :items, :category_id, :integer, null: false
  end
end
