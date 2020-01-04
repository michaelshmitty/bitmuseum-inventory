require 'rails_helper'

RSpec.describe Owner, type: :model do
  describe 'database columns' do
    it { should have_db_column(:name).of_type(:text).with_options(default: "", null: false) }
    it { should have_db_column(:contact_information).of_type(:text) }
    it { should have_db_column(:items_count).of_type(:integer).with_options(default: 0, null: false) }
  end

  describe 'associations' do
    it { should have_many(:items).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
