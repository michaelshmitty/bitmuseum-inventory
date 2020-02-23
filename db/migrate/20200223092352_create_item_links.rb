class CreateItemLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :item_links do |t|
      t.timestamps
      t.belongs_to :item
      t.belongs_to :linked_item
      t.index [:item_id, :linked_item_id], unique: true
    end
  end
end
