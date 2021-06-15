# frozen_string_literal: true

class AddColumnToFighters < ActiveRecord::Migration[6.0]
  def change
    change_table :fighters, bulk: true do |t|
      t.string :youtube_url
      t.string :twitter_url
    end
  end
end
