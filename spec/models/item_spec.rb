require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'database columns' do
    it { should have_db_column(:name).of_type(:text).with_options(default: "", null: false) }
    it { should have_db_column(:description).of_type(:text) }
    it { should have_db_column(:year).of_type(:text) }
    it { should have_db_column(:model_number).of_type(:text) }
    it { should have_db_column(:serial_number).of_type(:text) }
    it { should have_db_column(:authenticity).of_type(:string) }
    it { should have_db_column(:location).of_type(:text) }
    it { should have_db_column(:aasm_state).of_type(:string) }
  end

  describe 'database indexes' do
    it { should have_db_index(:user_id) }
    it { should have_db_index(:category_id) }
    it { should have_db_index(:name) }
    it { should have_db_index(:aasm_state) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:category) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
