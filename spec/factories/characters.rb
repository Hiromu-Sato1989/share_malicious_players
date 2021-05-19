# frozen_string_literal: true

FactoryBot.define do
  factory :character do
    sequence(:name) { |n| "character_#{n}" }

    trait :ryu do
      name { 'リュウ' }
    end
    trait :ken do
      name { 'ケン' }
    end
  end
end
