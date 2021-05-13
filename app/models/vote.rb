# frozen_string_literal: true

class Vote < ApplicationRecord
  belongs_to :fighter, touch: true
  counter_culture :fighter
end
