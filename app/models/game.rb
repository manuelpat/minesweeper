class Game < ApplicationRecord
  has_many :positions

  after_initialize :generate_configuration
  # add configuration default
  def generate_configuration
    self.num_row = 9 unless num_row.present?
    self.num_column = 9 unless num_column.present?
    self.num_mine = 10 unless num_mine.present?
  end
  
end
