# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :fighter

  validates :body, presence: true, length: { maximum: 256 }

  scope :comments_order, -> { order(created_at: :desc).limit(5) }
end
