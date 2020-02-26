require 'rails_helper'

RSpec.describe ItemLink, type: :model do
  describe 'database indexes' do
    it { should have_db_index(:item_id) }
    it { should have_db_index(:linked_item_id) }
    it { should have_db_index([:item_id, :linked_item_id]).unique }
  end

  describe 'associations' do
    it { should belong_to(:item) }
    it { should belong_to(:linked_item) }
  end

  it "should create two ItemLink" do
    item1 = create(:item)
    item2 = create(:item)

    expect do
      item1.linked_items << item2
    end.to change { ItemLink.count }.by(2)
  end

  it "should create inverse relationship" do
    item1 = create(:item)
    item2 = create(:item)
    item1.linked_items << item2

    expect(item2.linked_items).to include(item1)
  end

  it "should destroy inverse relationship" do
    item1 = create(:item)
    item2 = create(:item)
    item1.linked_items << item2

    item1.linked_items.destroy_all
    expect(item2.linked_items).to_not include(item1)
  end

  it "should destroy two ItemLinks" do
    item1 = create(:item)
    item2 = create(:item)
    item1.linked_items << item2

    expect do
      item1.linked_items.destroy_all
    end.to change { ItemLink.count }.by(-2)
  end

  it "should not allow to link to self" do
    item1 = create(:item)

    expect do
      item1.linked_items << item1
    end.to raise_error(ActiveRecord::RecordInvalid)
  end
end
