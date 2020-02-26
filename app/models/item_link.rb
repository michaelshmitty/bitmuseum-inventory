class ItemLink < ApplicationRecord
  after_create :create_inverse_relationship
  after_destroy :destroy_inverse_relationship

  validate :no_link_to_self

  validates :item, presence: true
  validates :linked_item, presence: true

  belongs_to :item
  belongs_to :linked_item, counter_cache: true, class_name: 'Item'


  private

  def create_inverse_relationship
    if linked_item.item_links.where(linked_item_id: item_id).none?
      linked_item.item_links.create(linked_item: item)
    end
  end

  def destroy_inverse_relationship
    item_link = linked_item.item_links.find_by(linked_item: item)
    item_link.destroy if item_link
  end

  def no_link_to_self
    errors.add(:linked_item, "can't be equal to item") if item == linked_item
  end
end
