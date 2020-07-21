require 'rails_helper'
describe Item do
  describe '#create' do

    it "allcomplete => save" do
      item = build(:item)
      expect(item).to be_valid
    end

    it "name must exist" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "status == nil otherComplete => save?" do
      item = build(:item, status:nil)
      expect(item).to be_valid
    end

    it "brand == nil otherComplete => save?" do
      item = build(:item, brand:nil)
      expect(item).to be_valid
    end

    it "seasonId == nil otherComplete => save?" do
      item = build(:item, spring_id:nil)
      expect(item).to be_valid
    end

    it "category must exist" do
      item = build(:item, category: nil)
      item.valid?
      expect(item.errors[:category]).to include("must exist")
    end

  end
end