class Game < ApplicationRecord
  has_many :positions

  before_create :generate_configuration
  # add configuration default
  def generate_configuration
    self.num_row = 9 unless num_row.present?
    self.num_column = 9 unless num_column.present?
    self.num_mine = 10 unless num_mine.present?
    self.is_active = true
  end
end
