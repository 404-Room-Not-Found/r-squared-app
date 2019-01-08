FactoryBot.define do
  factory :room do
    name    { "HRBB 124" }
    roomtype { "Lecture Hall" }
    description { "Average Sized lecture hall with a projector, seats 60" }
    occupied { "false" }
    booker { nil }
    operate_start {nil }
    operate_end { nil }
  end
end