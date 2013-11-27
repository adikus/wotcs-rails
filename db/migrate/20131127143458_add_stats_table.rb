class AddStatsTable < ActiveRecord::Migration
  def change
    create_table :player_stats do |t|

      t.float :battles
      t.float :wins
      t.float :defeats
      t.float :survived
      t.float :frags
      t.float :spotted
      t.float :accuracy
      t.float :damage
      t.float :capture
      t.float :defence
      t.float :experience
      t.float :wn7
      t.float :wn8
      t.float :efficiency
      t.float :sc3

      t.integer :stat_type

      t.references :player, limit: 8

      t.timestamps
    end
  end
end
