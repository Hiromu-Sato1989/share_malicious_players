# frozen_string_literal: true

class User < ApplicationRecord
  authenticates_with_sorcery!
  mount_uploader :icon, IconUploader
  has_many :comments, dependent: :destroy

  validates :password, presence: true, length: { minimum: 6 }, if: -> { new_record? || changes[:crypted_password] }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :email, format: { with: /\A\S+@\S+\.\S+\z/, message: 'の形式で入力してください' }

  validates :name, presence: true, length: { minimum: 3 }

  def own?(object)
    id == object.user_id
  end
end
