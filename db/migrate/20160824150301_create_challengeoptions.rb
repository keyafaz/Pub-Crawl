class CreateChallengeoptions < ActiveRecord::Migration[5.0]
  def change
    create_table :challengeoptions do |t|
      t.string :description
      t.integer :points
      t.references :challenge, foreign_key: true

      t.timestamps
    end
  end
end
