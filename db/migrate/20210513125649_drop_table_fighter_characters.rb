class DropTableFighterCharacters < ActiveRecord::Migration[6.0]
  def change
    drop_table :fighter_characters
  end
end
