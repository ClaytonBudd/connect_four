class Board
  attr_accessor :nodes, :win, :diagonal_left_heads, :diagonal_right_heads

  def initialize
    @nodes = {}
    @diagonal_left_heads = [[3,1],[2,1],[1,1],[1,2],[1,3],[1,4]]
    @diagonal_right_heads = [[3,7],[2,7],[1,7],[1,6],[1,5],[1,4]]
    @win = false
    self.board
  end

  def board()
    6.times do |row|
      7.times do |column|
        @nodes[[row+1, column+1]] = "[ ]"
      end
   end 
  end
   
  def display_board
    keys = @nodes.keys
    keys.sort!
    index = 0
    print " (1)  (2)  (3)  (4)  (5)  (6)  (7) " + "\n"
    6.times do
      7.times do
        print " " + "#{@nodes[keys[index]]}" + " " 
        index +=1
      end
      puts "\n"
    end   
  end

  def player_input(current_player)
    return gets.chomp.to_i
  end

  def mark_board(input, marker)
    row = 6
    column = input

    while row > 0
      test = @nodes[[row, column]]
      if @nodes[[row, column]] == "[ ]"
        @nodes[[row, column]] = "[" + marker + "]"
        break
      else
        row -= 1
      end
    end
  end
      
  def valid_input?(input)
    if input > 0 && input < 8
      return true
    else
      false
    end
  end

  def column_full?(input)
   return true if @nodes[[1, input]] != "[ ]"
  end

  def win?(current, marker, row_modifier, column_modifier)
    
    return false if current == nil
    count = 0

    while current[0] < 7 && current[1] < 8
      if @nodes[current] == "[" + marker + "]"
        count += 1
      else
        count = 0  
      end

      current[0] += row_modifier
      current[1] += column_modifier  
      
      return true if count == 4

    end
    false
  end

  def find_row_start(column)
    current = [1, column]
    while @nodes[current] == "[ ]"
      current[0] += 1
    end
    return current
  end

  def find_diagonal_start(node, direction, row_modifier, column_modifier)
    stack = direction.clone.map(&:clone)

    while stack != []
      head = stack.shift
      current = head.dup
      while current[0].between?(0,7) && current[1].between?(0,8)
        if current == node
          return head
        else
          current[0] += row_modifier
          current[1] += column_modifier
        end
      end
    end
    return nil
  end

  def check_win(input, player)
    current = find_row_start(input)
    scan_left = find_diagonal_start(current, @diagonal_left_heads, 1, 1)
    scan_right = find_diagonal_start(current, @diagonal_right_heads, 1, -1)
    row = [current[0], 1]
    column = [1,current[1]]
    if win?(row, player, 0, 1)
      @win = true
    elsif win?(column, player, 1, 0)
      @win = true
    elsif win?(scan_left, player, 1, 1)
      @win = true
    elsif win?(scan_right, player, 1, -1)
      @win = true
    end
  end

end
