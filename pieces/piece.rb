require 'colorize'

class Piece
  attr_reader :color, :board
  attr_accessor :pos

  def initialize(color, board, pos)
    @color, @board, @pos = color, board, pos
  end

  def to_s
    " #{self.symbol} "
  end

  def empty?
    self.class == Null
  end

  def valid_moves
     valid = []
     moves.each do |move|
        valid << move unless self.move_into_check?(move)
     end

     valid
  end

  def inspect
    {'class' => self.class, 'color' => @color, 'pos' => @pos }.inspect
  end

  def move_into_check?(end_pos)
    dup_board = @board.dup
    dup_board.move_piece!(pos,end_pos)
    dup_board.in_check?(color)
 end
end


