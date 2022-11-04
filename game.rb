require_relative 'display'
require_relative 'board'
require_relative 'player'

class Game
  
  def initialize
    @board = Board.new
    @display = Display.new(@board)

    @players = {
      "white" => Player.new(:white, @display),
      "black" => Player.new(:black, @display)
    }

    @current_player = @players["white"]
  end

  def play

  end

  private

  attr_writer :current_player

  def swap_turn!
    @current_player =   @current_player == @players["white"] ? @players["black"] : @players["white"]
  end
end