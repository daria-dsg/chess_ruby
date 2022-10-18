module Stepable
    def moves
        moves = []
        x, y = pos
        (-1 .. 1).each do |i|
            (-1 .. 1).each do |j|
                possible_move = [x + i, y + j]
                next if edge?(possible_move) || possible_move == pos
                moves << possible_move
            end
        end

        moves
    end

    def edge?(pos)
        (pos[0] < 0 || pos[0] > 7) || (pos[1] < 0 || pos[1] > 7)
    end
end