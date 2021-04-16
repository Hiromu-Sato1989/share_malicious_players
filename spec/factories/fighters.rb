# frozen_string_literal: true

FactoryBot.define do
  factory :fighter do
    sequence(:name) { |n| "name_#{n}" }
    league_id { 1 }
    association :league

    trait :daigo do
      name { 'umehara' }

      after(:create) do |fighter|
        create_list(:character, 3, fighters: [fighter])
      end
    end

    # after(:create) do |fighter|
    #   create_list(:character, 3, fighters: [fighter])
    #   create_list(:category, 3, fighters: [fighter])
    # end
  end
end
