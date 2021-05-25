# frozen_string_literal: true

class Character < ApplicationRecord
  has_many :fighters, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: true }
end
