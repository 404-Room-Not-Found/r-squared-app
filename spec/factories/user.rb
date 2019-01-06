FactoryBot.define do
  factory :user do
    name     { "Joe" }
    email    { "joe@gmail.com" }
    password { "blah" }
  end
end