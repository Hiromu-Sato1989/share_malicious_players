# frozen_string_literal: true

class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, presence: true, length: { minimum: 6 }, if: -> { new_record? || changes[:crypted_password] }

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A\S+@\S+\.\S+\z/, message: 'の形式で入力してください' }

  validates :name, presence: true, length: { minimum: 3 }
end
