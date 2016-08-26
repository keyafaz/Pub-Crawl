class CreateGameparticipations < ActiveRecord::Migration[5.0]
  def change
    create_table :gameparticipations do |t|
      t.references :user, foreign_key: true
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
