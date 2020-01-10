class Owner < ApplicationRecord
  has_many :items, dependent: :destroy

  validates :name, presence: true

  default_scope { order(name: :asc) }
end
