# generate board with mine
class PositionsGenerationService
  def self.generate(curr_game)
    arr_positions = []
    position_y = curr_game.num_column - 1
    position_x = curr_game.num_row - 1
    Array(0..position_x).each do |x|
      Array(0..position_y).each do |y|
        position = { x: x, y: y, has_mine: false, state: :uncovered, value: 0 }
        arr_positions.push(position)
      end
    end
    generate_mine(arr_positions, curr_game)
  end

  private

  private_class_method def self.generate_mine(arr_positions, curr_game)
    Array(0..(curr_game.num_mine - 1)).each do
      arr_mine = arr_positions.each_with_index.select { |_v, i| arr_positions[i][:has_mine] == true }.map { |x| x[1] }
      new_arr = Array(0..(arr_positions.length - 1)) - arr_mine
      index = new_arr.sample
      position_mine = arr_positions[index]
      position_mine[:has_mine] = true
      add_value(position_mine[:x], position_mine[:y], arr_positions, curr_game)
    end
    arr_positions
  end

  # add number around the mine
  private_class_method def self.add_value(x, y, arr_positions, curr_game)
    # top left => x -1 , y - 1
    # top => x - 1, y
    # top right => x,+ 1, y -1
    # left => x , y -1
    # rigth => x , y + 1
    # down left => x + 1, y-1
    # down => x + 1, y
    # down right => x + 1 , y + 1
    position_values = [[x - 1, y - 1], [x - 1, y], [x + 1, y - 1], [x, y - 1], [x, y + 1], [x + 1, y - 1], [x + 1, y],
                       [x + 1, y + 1]]
    position_values.each do |v|
      next if v[0].negative? || v[0] >= curr_game.num_column
      next if v[1].negative? || v[1] >= curr_game.num_row

      position = arr_positions.select { |p| p[:y] == v[1] && p[:x] == v[0] }.first
      position[:value] = (position[:value] + 1) unless position[:has_mine]
    end
  end
end
