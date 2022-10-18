module Slideable
    HORIZONTAL_DIRS = [
        [0, -1],
        [-1, 0],
        [0, 1],
        [1, 1]
    ]

    DIAGONAL_DIRS = [
        [-1, -1],
        [-1, 1],
        [1, 1],
        [1, -1]
    ]

    def horizontal_dirs(pos)
        HORIZONTAL_DIRS.map do |dirs|
            dirs.map.with_index do |dir,i|
                    pos[i] + dir
            end
        end
    end

    def diagonal_dirs(pos)
        DIAGONAL_DIRS.map do |dirs|
            dirs.map.with_index do |dir,i|
                    pos[i] + dir
            end
        end
    end


end