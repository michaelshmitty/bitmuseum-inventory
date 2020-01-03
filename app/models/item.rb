class Item < ApplicationRecord
  AUTHENTICITY_STATES = %w[original replica]

  include AASM

  belongs_to :user
  belongs_to :category
  has_many_attached :images

  validates :name, presence: true

  # NOTE(m): State machine
  aasm do
    state :unknown, initial: true
    state :working, :needs_cleaning, :needs_repair, :broken
  end
end
