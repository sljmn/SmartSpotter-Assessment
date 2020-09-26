# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { 'you@evil-corp.com' }
    password { 'foobar' }
  end
end
