class AddExtraFieldsToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :model_number, :text
    add_column :items, :serial_number, :text
    add_column :items, :authenticity, :string
    add_column :items, :location, :text
    add_column :items, :aasm_state, :string
    add_index :items, :aasm_state
  end
end
