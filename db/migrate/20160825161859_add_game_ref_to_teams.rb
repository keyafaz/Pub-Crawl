class AddGameRefToTeams < ActiveRecord::Migration[5.0]
  def change
    add_reference :members, :game, foreign_key: true

  end
end
