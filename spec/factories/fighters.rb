# frozen_string_literal: true

FactoryBot.define do
  factory :fighter do
    sequence(:name) { |n| "name_#{n}" }
    league_id { 1 }
    association :league

    after(:create) do |fighter|
      create(:fighter_category, fighter: fighter, category: create(:category))
      create(:fighter_character, fighter: fighter, character: create(:character))
    end

    trait :daigo do
      name {'umehara'}
    end
    
  end
end
