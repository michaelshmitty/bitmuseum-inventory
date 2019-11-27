require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'database columns' do
    it { should have_db_column(:name).of_type(:text).with_options(default: "", null: false) }
  end

  describe 'associations' do
    it { should have_many(:items).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
