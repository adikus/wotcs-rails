class AddIndexesToChanges < ActiveRecord::Migration
  def change
    add_index :changes, :clan_id, :name => 'clan_id_changes_ix'
    add_index :changes, :player_id, :name => 'player_id_ix'
  end
end
