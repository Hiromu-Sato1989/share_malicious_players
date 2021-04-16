# frozen_string_literal: true

class FighterCategory < ApplicationRecord
  belongs_to :fighter
  belongs_to :category
end
