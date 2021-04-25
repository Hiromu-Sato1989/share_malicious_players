# frozen_string_literal: true

class Fighter < ApplicationRecord
  MAX_CHARACTERS_COUNT = 2

  belongs_to :league
  has_many :fighter_characters, dependent: :destroy
  has_many :characters, through: :fighter_characters
  has_many :fighter_categories, dependent: :destroy
  has_many :categories, through: :fighter_categories
  has_many :votes, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :name, length: { in: 6..16 }
  validates :name, format: { with: /\A[a-zA-Z0-9_-]+\z/ }

  validates :league_id, presence: true

  validates :fighter_characters, length: { maximum: MAX_CHARACTERS_COUNT }

  scope :number_of_votes, -> { order(votes_count: :desc).limit(5) }
  scope :new_arrival, -> { order(created_at: :desc).limit(5) }

  # scopeで検索できないか模索中…
  # scope :search_fighter, ->(name) { where('name like?', "#{name}%") }
end
