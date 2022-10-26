require_relative 'pieces'
require 'byebug'

class Board
  attr_reader :rows
  
  def initialize
    @nil = Null.new
    @rows = Array.new(8){Array.new(8, @nil)}
    populate_board
  end

  def populate_board
    populate_pawns
    populate_black
    populate_white
  end

  def populate_pawns
    (0 .. 7).each do |col|
      pos_black = [1,col]
        self[pos_black] = Pawn.new(:black, self, pos_black)

        pos_white = [6, col]
        self[pos_white] = Pawn.new(:white, self, pos_white)
    end
  end

  def populate_black
    self[[0, 0]] = Rook.new(:black, self, [0, 0])
    self[[0, 7]] = Rook.new(:black, self, [0, 7])

    self[[0, 1]] = Knight.new(:black, self, [0, 1])
    self[[0, 6]] = Knight.new(:black, self, [0, 6])

    self[[0, 2]] = Bishop.new(:black, self, [0, 2])
    self[[0, 5]] = Bishop.new(:black, self, [0, 5])

    self[[0, 3]] = Queen.new(:black, self, [0, 3])
    self[[0, 4]] = King.new(:black, self, [0, 4])
  end

  def populate_white
    self[[7, 0]] = Rook.new(:white, self, [7, 0])
    self[[7, 7]] = Rook.new(:white, self, [7, 7])

    self[[7, 1]] = Knight.new(:white, self, [7, 1])
    self[[7, 6]] = Knight.new(:white, self, [7, 6])

    self[[7, 2]] = Bishop.new(:white, self, [7, 2])
    self[[7, 5]] = Bishop.new(:white, self, [7, 5])

    self[[7, 3]] = Queen.new(:white, self, [7, 3])
    self[[7, 4]] = King.new(:white, self, [7, 4])
  end


  def [](pos)
    raise "Invalid position" unless valid_pos?(pos)

    x, y = pos
    @rows[x][y]
  end

  def []=(pos,val)
    raise "Invalid position" unless valid_pos?(pos)

    x, y = pos
    @rows[x][y] = val
  end

  def move_piece(start_pos, end_pos)
    raise "start position is empty" if empty?(start_pos)
    piece = self[start_pos]
    
    if piece.moves.include?(end_pos)
        piece.pos = end_pos
        self[end_pos], self[start_pos] = piece, @nil
    else
        raise "end position is not valid "
    end
  end

  def valid_pos?(pos)
    x, y = pos
    x.between?(0,7) && y.between?(0,7)
  end


  def empty?(pos)
     self[pos].empty?
  end
end


        
