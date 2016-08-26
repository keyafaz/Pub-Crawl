class Place < ApplicationRecord
	has_many :games, through: :placegames
	has_many :placegames

end
