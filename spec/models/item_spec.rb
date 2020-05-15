require 'rails_helper'
describe Item do
  describe '#create' do

    it "名前がなければ登録できない" do
      item = FactoryBot.build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "商品紹介がなくても登録できる" do
      item = FactoryBot.build(:item)
      expect(item).to be_valid
    end

    it "ブランドがなくても登録できる" do
      item = FactoryBot.build(:item)
      expect(item).to be_valid
    end

    it "カテゴリーがなければ投稿できない" do
      item = FactoryBot.build(:item, category: nil)
      item.valid?
      expect(item.errors[:category]).to include("can't be blank")
    end

  end
end