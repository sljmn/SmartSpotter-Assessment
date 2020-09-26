# frozen_string_literal: true

FactoryBot.define do
  factory :booking do
    start_time { Faker::Time.forward(days: 2, period: :morning) }
    end_time { Faker::Time.forward(days: 2, period: :evening) }
    date { Faker::Date.forward(days: 2) }
    room { create(:room) }
    user { create(:user) }

   
  end
end
