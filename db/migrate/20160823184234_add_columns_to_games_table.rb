class AddColumnsToGamesTable < ActiveRecord::Migration[5.0]
  def change
  	add_column :games, :num_of_players, :integer
  	add_column :games, :num_of_bars, :integer
  	add_column :games, :date_time, :datetime
  end
end
