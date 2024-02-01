class Messages
  
  def start_of_round_message(game, board)
    board.display_board
    puts "#{game.current_player.player_id}" + " - Please select a column to drop your marker (1-7): "
  end

  def invalid_selection
    puts "-----You have entered an invalid selection please choose between 1 and 7"
  end

  def win(game, board)
    board.display_board
    puts "#{game.current_player.player_id}" + " Wins!"
  end
    
end