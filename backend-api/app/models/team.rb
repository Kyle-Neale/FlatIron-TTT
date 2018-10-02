class Team < ApplicationRecord
  has_many :users
  has_many :blocks
  belongs_to :game
end
