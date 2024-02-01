require_relative "board.rb"
require_relative "player.rb"
require_relative "messages.rb"

class Game
  attr_accessor :current_player, :player_1, :player_2


  def initialize
    @player_1 = Player.new("R", "player_1")
    @player_2 = Player.new("W", "player_2")
    @current_player = [@player_1, @player_2].sample
    @board = Board.new
    @board.build_board
    @board.unmark_board
    @messages = Messages.new
    @turns = 0
  end

  def play_round

    @messages.start_of_round_message(self, @board)
    next_player(@current_player)
    input = @board.player_input(@current_player)

    while @board.valid_input?(input) == false
      @messages.invalid_selection
      input = @board.player_input(@current_player)
    end
      @board.mark_board(input, @current_player.marker)
      @board.check_win(input, @current_player.marker)
      
    @turns +=1
  end

  def draw
    puts "\n" + "-----------------It's a draw, Play again-----------------" + "\n" + "\n"
    game = Game.new
    game.play_game
  end

  def play_game
    while @board.win == false
      puts @board.win
      if @turns >= 42
        draw
        break
      else
        play_round
      end

    end
    @messages.win(self, @board)
  end



  def next_player(current_player)
    if current_player == @player_1
      @current_player = @player_2
    else @current_player = @player_1
  end
end

  
end

game = Game.new
game.play_game
