# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "name_#{n}" }
    sequence(:email) { |n| "sample_#{n}@example.com" }
    sequence(:password) { |n| "password_#{n}" }
  end
end
