# frozen_string_literal: true

FactoryBot.define do
  factory :league do
    sequence(:name) { |n| "league_#{n}" }

    trait :bronze do
      name { 'ブロンズ' }
    end

    trait :silver do
      name { 'シルバー' }
    end

    trait :gold do
      name { 'ゴールド' }
    end
  end
end
