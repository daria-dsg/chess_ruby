require "byebug"

module Slideable
    HORIZONTAL_DIRS = [
        [0, -1],
        [-1, 0],
        [0, 1],
        [1, 0]
    ]

    DIAGONAL_DIRS = [
        [-1, -1],
        [-1, 1],
        [1, 1],
        [1, -1]
    ]

    def horizontal_dirs
        moves = []
        HORIZONTAL_DIRS.each do |dirs|
            dup = pos
            until edge?(dup)
                dup = [dup[0] + dirs[0], dup[1] + dirs[1]]
                moves << dup 
            end
        end
        moves
    end

    def diagonal_dirs(pos)
    end

    def edge?(dup)
        (dup[0] == 0 || dup[0] == 7) || (dup[1] == 0 || dup[1] == 7)
    end
end