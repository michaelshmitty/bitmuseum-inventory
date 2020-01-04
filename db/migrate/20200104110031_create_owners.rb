class CreateOwners < ActiveRecord::Migration[6.0]
  def change
    create_table :owners do |t|
      t.text :name, default: "", null: false
      t.text :contact_information
      t.integer :items_count, default: 0, null: false

      t.timestamps
    end
  end
end
