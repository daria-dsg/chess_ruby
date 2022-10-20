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
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS 
    end

    def moves
        moves = []
        move_dirs.each do |dirs|
            dup = pos
            until grow_moves?(dup)
                dup = [dup[0] + dirs[0], dup[1] + dirs[1]]
                moves << dup 
            end
        end
        moves   
    end

    def grow_moves?(dup)
        (dup[0] == 0 || dup[0] == 7) || (dup[1] == 0 || dup[1] == 7)
    end
end