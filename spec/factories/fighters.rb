# frozen_string_literal: true

FactoryBot.define do
  factory :fighter do
    sequence(:name) { |n| "name_#{n}" }
    association :league
    association :character

    trait :daigo do
      name { 'umehara' }
    end
  end
end
