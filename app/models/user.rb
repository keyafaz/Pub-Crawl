class User < ApplicationRecord
  has_many :gameparticipations
  has_many :games_playing, through: :gameparticipations, source: :game
  has_many :members, dependent: :destroy
 
  has_secure_password
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :username, :uniqueness => { :case_sensitive => false }, :presence => true
  validates :username, length: { in: 2..30 }
  validates :password, length: { minimum: 8 }, allow_nil: true
  validates :email, :uniqueness => { :case_sensitive => false }, :format => { :with => email_regex }
end
