require 'rails_helper'
describe Item do
  describe '#create' do

    it "allcomplete => save" do
      item = build(:item)
      expect(item).to be_valid
    end

    # it "カテゴリーがなければ投稿できない" do
    #   item = FactoryBot.build(:item, category: nil)
    #   item.valid?
    #   expect(item.errors[:category]).to include("must exist")
    # end

  end
end