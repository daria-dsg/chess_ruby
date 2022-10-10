require "./pieces/piece.rb"
require "byebug"

class Board
    def initialize
        @rows = Array.new(8){Array.new(8)}
    end

    def [](pos)
        x, y = pos
        @rows[x][y]
    end

    def []=(pos,val)
        x, y = pos
        @rows[x][y] = val
    end

    def add_piece(piece,pos)
        self[pos] = piece
    end
end