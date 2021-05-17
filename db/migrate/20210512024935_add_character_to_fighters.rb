# frozen_string_literal: true

class AddCharacterToFighters < ActiveRecord::Migration[6.0]
  def change
    add_reference :fighters, :character, foreign_key: true
  end
end
