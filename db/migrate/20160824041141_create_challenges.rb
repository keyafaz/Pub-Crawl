class CreateChallenges < ActiveRecord::Migration[5.0]
  def change
    create_table :challenges do |t|
      t.string :challenges
      t.references :placegame, foreign_key: true

      t.timestamps
    end
  end
end
