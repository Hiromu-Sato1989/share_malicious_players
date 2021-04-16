# frozen_string_literal: true

class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.references :fighter, null: false, foreign_key: true
      t.string :ip

      t.timestamps
    end
  end
end
