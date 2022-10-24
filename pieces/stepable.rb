module Stepable
    def moves
        moves = []
        move_diffs.each do |dir_x,dir_y|
            cur_x, cur_y = pos
            
            new_pos = [cur_x + dir_x, cur_y + dir_y]
            new_x,new_y = new_pos
            
            next unless @board.valid_pos?(new_pos)

            next if blocked_moves?(new_pos)
    
            moves << new_pos 
            new_pos = [new_x + dir_x, new_y + dir_y]
        end

        moves              
    end

    def blocked_moves?(pos)
        self.color == @board[pos].color
    end
end