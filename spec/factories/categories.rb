# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "category_#{n}" }

    trait :kusshin do
      name { '屈伸' }
      # after(:create) do |category|
      #   character = create(:character, :ryu)
      #   league = create(:league, :bronze)
      #   fighter = create(:fighter, :daigo, categories: [category], character: character, league: league)
      # end
    end

    trait :namepu do
      name { '舐めプ' }
    end

    trait :setudan do
      name { '切断' }
    end
  end
end
