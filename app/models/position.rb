class Position < ApplicationRecord
  belongs_to :game

  validates :y, presence: true
  validates :x, presence: true
  validates :has_mine, inclusion: { in: [true, false] }
  validates :state, presence: true
  validates :value, presence: true

  enum enum_state: %i[covered uncovered flagged]
end
