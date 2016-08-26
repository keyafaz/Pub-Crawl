class Team < ApplicationRecord
  belongs_to :game
  has_many :members,  dependent: :destroy


  # validates :name, :presence => true,  length: { maximum: 20 }, on: :update

end
 