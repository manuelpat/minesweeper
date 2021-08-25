class GameSerializer < ActiveModel::Serializer
  attributes :id, :num_row, :num_column, :num_mine, :is_active

  has_many :positions
end
