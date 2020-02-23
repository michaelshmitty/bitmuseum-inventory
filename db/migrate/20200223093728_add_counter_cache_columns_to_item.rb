class AddCounterCacheColumnsToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :item_links_count, :integer, default: 0, null: false
  end
end
