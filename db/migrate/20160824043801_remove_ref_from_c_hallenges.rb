class RemoveRefFromCHallenges < ActiveRecord::Migration[5.0]
  def change
  	  	remove_column :placegames, :challenge_id

  end
end
