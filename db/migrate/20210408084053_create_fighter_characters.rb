# frozen_string_literal: true

class CreateFighterCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :fighter_characters do |t|
      t.references :fighter, null: false, foreign_key: true
      t.references :character, null: false, foreign_key: true

      t.timestamps
    end
  end
end
