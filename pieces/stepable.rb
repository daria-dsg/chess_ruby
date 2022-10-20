require "byebug"

module Stepable

    def moves
        move_diffs.map { |diff| [diff, pos].transpose.map(&:sum)}
    end

end