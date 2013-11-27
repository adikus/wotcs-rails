class AddAverageTierToStats < ActiveRecord::Migration
  def change
    add_column :player_stats, :average_tier, :float
  end
end
