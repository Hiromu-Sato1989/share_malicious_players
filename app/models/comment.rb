# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :fighter

  validates :body, presence: true, length: { maximum: 256 }
end
