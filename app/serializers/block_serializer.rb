class BlockSerializer < ActiveModel::Serializer
  attributes :id, :row, :column, :nought, :game_id
end
