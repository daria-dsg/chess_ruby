require_relative 'piece'

class Pawn < Piece

    def symbol
        "♙".colorize(color)
    end

    def moves
       moves = []
       dx, dy = pos[0] + forward_dir, pos[1]
       moves << [dx, dy]
       moves << [dx + forward_dir , dy]  if forward_steps == 2

       moves
    end

    private

    def at_start_row?
        start_row = color == :black ? 1 : 6
        pos[0] == start_row
    end

    def forward_dir
        color == :black ? 1 : -1
    end

    def forward_steps
        at_start_row? == true ? 2 : 1
    end

end