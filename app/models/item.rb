class Item < ApplicationRecord
  AUTHENTICITY_STATES = %w[original replica]

  include AASM

  belongs_to :user
  belongs_to :category, counter_cache: true
  belongs_to :brand, counter_cache: true
  belongs_to :owner, counter_cache: true
  has_many_attached :images

  # NOTE(m): Item linking functionality:
  has_many :item_links, dependent: :destroy
  has_many :linked_items, through: :item_links, dependent: :destroy

  validates :name, presence: true

  # NOTE(m): State machine
  aasm do
    state :unknown, initial: true
    state :working, :needs_cleaning, :needs_repair, :broken
  end


  def self.linkable_to(item)
    where.not(id: item.id).includes(:category)
                          .order('categories.name')
                          .order('items.name')
  end
end
