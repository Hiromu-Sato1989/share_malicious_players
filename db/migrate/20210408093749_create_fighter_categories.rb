# frozen_string_literal: true

class CreateFighterCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :fighter_categories do |t|
      t.references :fighter, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
