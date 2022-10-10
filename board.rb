require_relative "pieces.rb"
require "byebug"

class Board
    def initialize
        @rows = Array.new(8){Array.new(8)}
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
        self[end_pos], self[start_pos] = self[start_pos], nil
    end

    def valid_pos?(pos)
        x, y = pos
        x.between?(0,8) && y.between?(0,8)
    end

    def add_piece(piece,pos)
        raise "position is not empty" unless empty?(pos)
        self[pos] = piece
    end

    def empty?(pos)
        self[pos] == nil
    end
end