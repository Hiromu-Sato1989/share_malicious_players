FactoryBot.define do
  factory :league do
    sequence(:name) { |n| "name_#{n}" }
  end
end
