class RemovePlacegameRefFromChallenges < ActiveRecord::Migration[5.0]
  def change
  	 	remove_column :challenges, :placegame_id
  end
end
