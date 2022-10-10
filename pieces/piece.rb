require 'colorize'

class Piece
    def intitialize(color, board, pos)
        @color, @board, @pos = color, board, pos
    end

    def empty?
        self == nil
    end
end


