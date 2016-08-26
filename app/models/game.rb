class Game < ApplicationRecord
	has_many :gameparticipations
	has_many :users_playing, through: :gameparticipations, source: :user
	has_many :places, through: :placegames,  dependent: :destroy
	has_many :placegames, dependent: :destroy
	has_many :teams
	has_many :members

	validates :name, :presence => true,  length: { in: 2..30 }
	validates :date_time, :presence => true
end
