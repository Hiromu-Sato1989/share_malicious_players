# frozen_string_literal: true

class Vote < ApplicationRecord
  belongs_to :fighter
  counter_culture :fighter
end
