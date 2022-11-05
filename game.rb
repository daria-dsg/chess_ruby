require_relative 'board'
require_relative 'human_player'

class Game
  attr_reader :display, :board, :players, :current_player

  def initialize
    @board = Board.new
    @display = Display.new(@board)

    @players = {
      :white => Human_Player.new(:white, @display),
      :black => Human_Player.new(:black, @display)
    }

    @current_player = :white
  end

  def play
    until board.checkmate?(current_player)
       start_pos, end_pos = players[current_player].make_move(@board)
       board.move_piece(start_pos, end_pos)
       swap_turn!
    end
  end

  private

  def swap_turn!
    @current_player = current_player == :white ? :black : :white
  end
end