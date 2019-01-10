FactoryBot.define do
  factory :user do
    name     { "Anthony" }
    email    { "avoneiff@gmail.com" }
    password { "1234" }
    usertype { "student" }
  end
end