class RemoveGameRefFromPlace < ActiveRecord::Migration[5.0]
  def change
  	remove_column :places, :game_id
  end
end
