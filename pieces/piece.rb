require 'colorize'

class Piece
    attr_reader :color, :board
    attr_accessor :pos
    
    def initialize(color, board, pos)
        @color, @board, @pos = color, board, pos
    end

    def empty?
        self == nil
    end

    def inspect
        { 'class' => self.class, 'color' => @color, 'pos' => @pos }.inspect
    end
end


