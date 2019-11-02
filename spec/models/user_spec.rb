require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'database columns' do
    it { should have_db_column(:first_name).of_type(:string) }
    it { should have_db_column(:last_name).of_type(:string) }
    it { should have_db_column(:email).of_type(:string).with_options(default: "", null: false) }
    it { should have_db_column(:encrypted_password).of_type(:string).with_options(default: "", null: false) }
    it { should have_db_column(:reset_password_token).of_type(:string) }
    it { should have_db_column(:reset_password_sent_at).of_type(:datetime) }
    it { should have_db_column(:remember_created_at).of_type(:datetime) }
    it { should have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { should have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  describe 'database indexes' do
    it { should have_db_index(:email).unique }
    it { should have_db_index(:reset_password_token).unique }
  end

  describe 'methods' do
    describe "#full_name" do
      it "returns the concatenated first_name and last_name if they are set" do
        user = build(:user)
        expect(user.full_name).to eq "#{user.first_name} #{user.last_name}"
      end

      it "returns only the set name" do
        user = build(:user, last_name: nil)
        expect(user.full_name).to eq "#{user.first_name}"
      end

      it "returns nil if no name is set" do
        user = build(:user, first_name: nil, last_name: nil)
        expect(user.full_name).to be nil
      end
    end
  end
end
