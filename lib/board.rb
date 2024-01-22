require_relative "column"

class Board
  attr_reader :columns

  def initialize
    @columns = Array.new(7, [])
  end


  def player_input(current_player)
    return gets.chomp.to_i
  end

  def mark_board(input, marker)
    input = (input-1)
    column = Column.new
      
      if @columns[input] == []
        @columns[input] = column.add_marker(marker)
      else
        @columns[input].add_marker(marker)
      end

  end
      
  def valid_input?(input)
    true if input > 0 && input < 8
    false
  end

  def column_room?(column)
    false if column.size > 6
    true
  end

end

