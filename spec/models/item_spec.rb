require 'rails_helper'
describe Item do
  describe '#create' do
    it "名前がなければ登録できない" do
      item = FactoryBot.build(:item)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end
  end
end