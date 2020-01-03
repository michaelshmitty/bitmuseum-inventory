class CreateBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :brands do |t|
      t.text :name, default: "", null: false

      t.timestamps
    end
  end
end
