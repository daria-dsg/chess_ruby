require_relative "piece.rb"

class King < Piece

    def symbol
        "♔".colorize(color)
    end

end