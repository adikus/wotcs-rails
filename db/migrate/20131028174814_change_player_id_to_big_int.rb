class ChangePlayerIdToBigInt < ActiveRecord::Migration
  def change
    change_column :players, :id, 'bigint'
  end
end
