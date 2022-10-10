require_relative "piece.rb"

class Pawn < Piece

    def symbol
        "♙".colorize(color)
    end

end