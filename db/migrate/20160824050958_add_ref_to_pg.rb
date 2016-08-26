class AddRefToPg < ActiveRecord::Migration[5.0]
  def change
    add_reference :placegames, :challenge, foreign_key: true
  end
end
