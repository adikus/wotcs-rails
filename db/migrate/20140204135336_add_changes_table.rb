class AddChangesTable < ActiveRecord::Migration
  def change
    create_table :changes do |t|
      t.references :clan, limit: 8
      t.references :player, limit: 8
      t.boolean    :joined
      t.timestamp  :changed_at
      t.timestamp  :changed_at_max
    end
  end
end
