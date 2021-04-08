class CreateLeagues < ActiveRecord::Migration[6.0]
  def change
    create_table :leagues do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :leagues, :name, unique: true
  end
end
