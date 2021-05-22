# frozen_string_literal: true

class Fighter < ApplicationRecord
  # ＊キャラを複数選択で多対多の場合に使用
  # MAX_CHARACTERS_COUNT = 2

  is_impressionable counter_cache: true

  belongs_to :league
  # belongs_toにoptional: trueをつけると、外部キーがnilでもDBへ保存できるようになる
  belongs_to :character, optional: true
  # has_many :fighter_characters, dependent: :destroy
  # has_many :characters, through: :fighter_characters
  # ＊キャラを複数選択で多対多の場合に使用
  has_many :fighter_categories, dependent: :destroy
  has_many :categories, through: :fighter_categories
  has_many :votes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false, message: 'がすでに登録されています。検索してみてください' }
  validates :name, length: { in: 6..16 }
  validates :name, format: { with: /\A[a-zA-Z0-9_-]+\z/, message: 'は英字、数字、「 - 」、「 _ 」で入力してください' }

  # カテゴリー未選択の場合登録できない処理
  validates :category_ids, presence: { message: 'を選択してください' }

  # ＊キャラを複数選択で多対多の場合に使用
  # 選べるキャラクターを2キャラまでに制限する。選べすぎても情報として意味がないため
  # validates :fighter_characters, length: { maximum: MAX_CHARACTERS_COUNT, message: 'は最大で2人まで選択できます' }

  scope :number_of_votes, -> { order(votes_count: :desc).limit(5) }
  scope :new_arrival, -> { order(created_at: :desc).limit(5) }
  scope :number_of_impression, -> { order(impressions_count: :desc).limit(5) }

  # indexの表示に使用
  scope :search_fighter, ->(name) { where('name like?', "#{name}%") }
end
