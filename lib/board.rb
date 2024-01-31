class Board
  attr_reader :nodes

  def initialize
    @nodes = {}
  end

  def add_node(node)
    @nodes[node] = find_edges(node) 
  end

  def unmark_board
    @nodes.each do | k, v | @nodes[k] = "[ ]"
    end
  end  

  def build_board(node = [1,1])
    queue = [node]
    visited = []
    while queue != []
      current = queue.shift
      next if visited.include? current

      edges = add_node(current)
      edges.to_a.each { |e| queue.append(e) }
      visited.append(current) unless visited.include?(current)

    end
  end



  def find_edges(node)
    possible_edges = [[-1,0],[-1,1],[0,1],[1,1],[1,0],[1,-1],[0,-1],[-1,-1]]

    legal_edges = []
    possible_edges.each { |a,b| legal_edges.append([node[0] + a, node[1] + b])}
    legal_edges.select! { | row | row[0] > 0 && row[0] < 7 }
    legal_edges.select! { | column | column[1] > 0 && column[1] < 8} 
    legal_edges
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
    true if input > 0 && input < 8
    false
  end

  def column_room?(column)
    false if column.size > 6
    true
  end

end

board = Board.new
board.build_board
board.unmark_board
#board.display_board
board.mark_board(1, "W")
board.mark_board(2, "B")
board.mark_board(2, "B")
board.mark_board(3, "W")
board.mark_board(2, "B")
board.mark_board(6, "W")
board.mark_board(6, "B")
board.mark_board(7, "W")
board.display_board
