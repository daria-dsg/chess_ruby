require "colorize"

class Piece
    attr_reader :pos, :color
    
    def initialize(color, board, pos)
        @color, @board, @pos = color, board, pos
    end

    def empty?
        self == nil
    end

    # return an array of places where piece can move
    def valid_moves
        
    end
end


