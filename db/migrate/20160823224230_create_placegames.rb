class CreatePlacegames < ActiveRecord::Migration[5.0]
  def change
    create_table :placegames do |t|
      t.references :place, foreign_key: true
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
