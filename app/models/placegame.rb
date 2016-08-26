class Placegame < ApplicationRecord
  belongs_to :place
  belongs_to :game
  belongs_to :challenge

end
