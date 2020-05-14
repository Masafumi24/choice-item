FactoryBot.define do

  factory :item do
    name              {""}
    status            {"去年の夏に購入したTシャツ"}
    brand             {"Supreme"}
    spring_id         {1}
    summer_id         {nil}
    autumn_id         {1}
    winter_id         {nil}
  end

end