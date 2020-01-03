class ChangeBrandReferenceOnItem < ActiveRecord::Migration[6.0]
  def change
    change_column :items, :brand_id, :integer, null: false
  end
end
