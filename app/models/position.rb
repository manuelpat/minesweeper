class Position < ApplicationRecord
  belongs_to :game

  validates :y, presence: true
  validates :x, presence: true
  validates :has_mine, inclusion: { in: [true, false] }
  validates :value, presence: true

  enum state: %i[covered uncovered flagged]
end
