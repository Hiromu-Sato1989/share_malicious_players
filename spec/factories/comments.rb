# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    body { 'MyString' }
    user { nil }
    fighter { nil }
  end
end
