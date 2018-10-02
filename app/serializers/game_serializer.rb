class GameSerializer < ActiveModel::Serializer
  has_many :teams
  attributes :id
end
