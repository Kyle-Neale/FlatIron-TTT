class Team < ApplicationRecord
  has_many :user_teams
  has_many :users, through: :user_teams
  has_many :blocks
  belongs_to :game
end
