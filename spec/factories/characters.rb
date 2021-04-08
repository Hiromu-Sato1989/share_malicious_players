FactoryBot.define do
  factory :character do
    sequence(:name) { |n| "name_#{n}" }
  end
end
