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
      
      begin
        start_pos, end_pos = players[current_player].make_move(@board)
        board.move_piece(current_player,start_pos, end_pos)
      rescue => e
        puts "#{e.message}.Try again"
        sleep 3
        retry
      end

       swap_turn!
    end
    display.render

    puts "Game is over, #{current_player} is in check!"
  end

  private

  def swap_turn!
    @current_player = current_player == :white ? :black : :white
  end
end

if $PROGRAM_NAME == __FILE__
  Game.new.play
end