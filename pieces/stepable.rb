module Stepable
  def moves
    moves = []
    move_diffs.each do |dx,dy|
      x,y = pos 
      move =[x + dx,y + dy]

      next unless board.valid_pos?(move)

      if board.empty?(move)
        moves << move
      elsif color != board[move].color
        # can take opposite piece
        moves << move
      end
    end

    moves              
  end
end