class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :name, default: "", null: false
      t.text :description
      t.text :year
      t.references :user, null: false, foreign_key: true

      t.timestamps

      t.index :name
    end
  end
end
