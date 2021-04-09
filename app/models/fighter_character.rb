# frozen_string_literal: true

class FighterCharacter < ApplicationRecord
  belongs_to :fighter
  belongs_to :character
end
