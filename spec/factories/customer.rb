# frozen_string_literal: true

FactoryBot.define do
  factory :customer do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number }
    avatar { 'avatar.png' }
    smoker { %w[Yes No].sample }
  end
end
