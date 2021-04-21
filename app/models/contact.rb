# frozen_string_literal: true

class Contact < ApplicationRecord
  validates :message, presence: true
end
