
require_relative "piece.rb"

class Rook < Piece
    

    def symbol
        "♖".colorize(color)
    end

    def move_dirs
        horizontal_dirs(pos)
    end

end