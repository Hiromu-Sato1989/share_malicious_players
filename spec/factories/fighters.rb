# frozen_string_literal: true

FactoryBot.define do  
  factory :fighter do
    sequence(:name) { |n| "name_#{n}" }
    association :league
    association :character
    # category_ids { [] }
    # after(:create) do |fighter|
    #   create(:fighter_category, fighter: fighter, category: create(:category, :kusshin))
    # end

    trait :daigo do
      name { 'umehara' }
    end
  end
end
