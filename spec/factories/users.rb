# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'name' }
    sequence(:email) { |n| "sample_#{n}@example.com" }
    password { 'password' }

    trait :equal_email do
      email { 'tokido@akuma.com' }
    end
  end
end
