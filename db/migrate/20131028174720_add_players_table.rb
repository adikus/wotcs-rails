class AddPlayersTable < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.references :clan, limit: 8
      t.integer :status

      t.timestamps
    end
  end
end
