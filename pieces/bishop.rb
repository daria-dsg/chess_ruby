require_relative "piece.rb"

class Bishop < Piece
    

    def symbol
        "♗".colorize(color)
    end

    private
    
    def move_dirs
        diagonal_dirs(pos)
    end

end