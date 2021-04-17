# frozen_string_literal: true

class AddVotesCountToFighters < ActiveRecord::Migration[6.0]
  def self.up
    add_column :fighters, :votes_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :fighters, :votes_count
  end
end
