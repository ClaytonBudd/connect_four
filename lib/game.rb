require_relative "board.rb"
require_relative "player.rb"
require_relative "messages.rb"
require_relative "linked_list"
require_relative "node.rb"

class Game
  attr_accessor :current_player, :player_1, :player_2


  def initialize
    @player_1 = Player.new("R", "player_1")
    @player_2 = Player.new("B", "player_2")
    @current_player = [@player_1, @player_2].sample
    @board = Board.new
    @messages = Messages.new
  end

  
end