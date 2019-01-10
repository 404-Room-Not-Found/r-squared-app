require 'faker'

FactoryBot.define do
  factory :searching do
    startDate { Faker::Date.start_date }
    endDate { Faker::Date.end_date }
    startTime { Faker::Time.start_time }
    endTime { Faker::Time.end_time }
  end
end