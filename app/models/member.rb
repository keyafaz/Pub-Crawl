class Member < ApplicationRecord
  belongs_to :team
  belongs_to :user
  belongs_to :game
end
