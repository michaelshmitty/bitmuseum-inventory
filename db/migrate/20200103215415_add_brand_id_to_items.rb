class AddBrandIdToItems < ActiveRecord::Migration[6.0]
  def change
    # TODO(m): Add this null constraint in production!
    # add_reference :items, :brand, null: false, foreign_key: true
    add_reference :items, :brand, foreign_key: true
  end
end
