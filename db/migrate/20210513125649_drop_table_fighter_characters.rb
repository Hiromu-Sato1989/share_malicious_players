# frozen_string_literal: true

class DropTableFighterCharacters < ActiveRecord::Migration[6.0]
  def change
    drop_table :fighter_characters do |t|
      t.references :fighter
      t.references :category
    end
  end
end
