# frozen_string_literal: true

class CreateFighters < ActiveRecord::Migration[6.0]
  def change
    create_table :fighters do |t|
      t.string :name, null: false
      t.references :league, null: false, foreign_key: true

      t.timestamps
    end
    add_index :fighters, :name, unique: true
  end
end
