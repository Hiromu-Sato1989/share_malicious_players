class AddImpressionsCountToFighters < ActiveRecord::Migration[6.0]
  def change
    add_column :fighters, :impressions_count, :integer, default: 0
  end
end
