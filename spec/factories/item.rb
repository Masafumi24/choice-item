FactoryBot.define do

  factory :item do
    name              {"テストです"}
    status            {"aa"}
    brand             {"aa"}
    spring_id         {1}
    summer_id         {1}
    autumn_id         {1}
    winter_id         {1}
    user
    category
    after(:build) do |item|
      item.images << build(:image, item: item)
    end

  end

end