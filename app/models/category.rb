# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :fighter_categories, dependent: :destroy
  has_many :fighters, through: :fighter_categories

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: true }
end
