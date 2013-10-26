class ChangeIdToBigint < ActiveRecord::Migration
  def change
    change_column :clans, :id, 'bigint'
  end
end
