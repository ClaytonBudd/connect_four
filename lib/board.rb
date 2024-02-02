class Board
  attr_accessor :nodes, :win

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


  def win_row?(current, marker, row_modifier, column_modifier)
    
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

  def find_row(column)
    current = [1, column]
    while @nodes[current] == "[ ]"
      current[0] += 1
    end
    return current
  end

  def scan_diag_left(node)
    stack = @diagonal_left_heads.clone.map(&:clone)
    while stack != []
      head = stack.shift
      current = head.dup
      while current[0] < 7 && current[1] < 8
        if current == node
          return head
        else
          current[0] +=1
          current[1] +=1
        end
      end
    end
    return nil
  end

  def scan_diag_right(node)
    stack = @diagonal_right_heads.clone.map(&:clone)
    while stack != []
      head = stack.shift
      current = head.dup
      while current[0] < 7 && current[1] > 0
        if current == node
          return head
        else
          current[0] +=1
          current[1] -=1
        end
      end
    end
    return nil
  end





  def check_win(input, player)
    current = find_row(input)
    scan_left = scan_diag_left(current)
    scan_right = scan_diag_right(current)
    row = [current[0], 1]
    column = [1,current[1]]
    if win_row?(row, player, 0, 1)
      @win = true
    elsif win_row?(column, player, 1, 0)
      @win = true
    elsif win_row?(current, player, 1, 1)
      @win = true
    elsif win_row?(current, player, 1, -1)
      @win = true
    else
    end
  end

end

# board = Board.new
# board.mark_board(1, "B")
# board.mark_board(2, "B")
# board.mark_board(2, "B")
# board.mark_board(3, "W")
# board.mark_board(3, "W")
# board.mark_board(3, "B")
# board.mark_board(4, "W")
# board.mark_board(4, "B")
# board.mark_board(4, "W")
# board.mark_board(4, "B")
# board.mark_board(2, "W")
# board.mark_board(1, "B")
# board.mark_board(1, "W")
# board.mark_board(1, "W")
# # # board.mark_board(6, "W")
# # # board.mark_board(3, "W")
# board.display_board
# # puts "#{board.win_row?(3, "B")}"
# # # puts "#{board.win_column?(1, "B")}"
# # # #puts "#{board.win_column?(6,"[B]")}"
# puts board.win_diagonal_right?(4, "B")
# puts board.win_diagonal_left?(1, "W")



# next put it all together with player turns and test it out.