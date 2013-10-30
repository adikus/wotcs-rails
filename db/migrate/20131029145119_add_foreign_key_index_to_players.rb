class AddForeignKeyIndexToPlayers < ActiveRecord::Migration
  def change
    add_index :players, :clan_id, :name => 'clan_id_ix'
  end
end
