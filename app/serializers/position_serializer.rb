class PositionSerializer < ActiveModel::Serializer
  attributes :id, :x, :y, :has_mine, :state, :value
end
