class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :lockable

  has_many :items, dependent: :destroy

  def full_name
    full_name = []
    full_name << first_name if first_name.present?
    full_name << last_name if last_name.present?
    full_name.empty? ? nil : full_name.join(" ")
  end
end
