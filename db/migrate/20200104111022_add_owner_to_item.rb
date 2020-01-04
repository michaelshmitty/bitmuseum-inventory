class AddOwnerToItem < ActiveRecord::Migration[6.0]
  def change
    # TODO(m): Fix this null: false when every Item has an owner.
    # add_reference :items, :owner, null: false, foreign_key: true
    add_reference :items, :owner, foreign_key: true
  end
end
