# frozen_string_literal: true

class Fighter < ApplicationRecord
  belongs_to :league
  has_many :fighter_characters, dependent: :destroy
  has_many :characters, through: :fighter_characters
  has_many :fighter_categories, dependent: :destroy
  has_many :categories, through: :fighter_categories
  has_many :votes, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: true }
  validates :league_id, presence: true
end
