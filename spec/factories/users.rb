FactoryBot.define do
  
  factory :user do
    nickname {"こんちゃん"}
    email {"testkonchan@gmail.com"}
    image {"test.jpeg"}
    password {"12345678"}
    password_confirmation {"12345678"}
  end

end