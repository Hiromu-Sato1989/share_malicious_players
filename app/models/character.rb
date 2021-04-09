# frozen_string_literal: true

class Character < ApplicationRecord
  has_many :fighter_characters, dependent: :destroy
  has_many :fighters, through: :fighter_characters

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: true }
end
