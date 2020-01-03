class AddCounterCacheColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :items_count, :integer, default: 0, null: false
    add_column :brands, :items_count, :integer, default: 0, null: false
  end
end
