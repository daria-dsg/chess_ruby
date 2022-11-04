require_relative 'display'
require_relative 'board'
require_relative 'player'

class Game
  def initialize
    @board = Board.new
    @display = Display.new(@board)

    @players = {
      "player_1" => Player.new(:white, @display),
      "player_2" => Player.new(:black, @display)
    }

    @current_player = @players["player_1"]
  end

  def play
     @display.render
     @current_player.make_move
  end
end