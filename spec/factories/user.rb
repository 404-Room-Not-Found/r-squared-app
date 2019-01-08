FactoryBot.define do
  factory :user do
    name     { "Joe" }
    email    { "joe@gmail.com" }
    password { "blah" }
    usertype { "student" }
  end
end