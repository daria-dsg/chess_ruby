module Slideable
  HORIZONTAL_DIRS = [
    [0, -1],
    [-1, 0],
    [0, 1],
    [1, 0]
  ].freeze

  DIAGONAL_DIRS = [
    [-1, -1],
    [-1, 1],
    [1, 1],
    [1, -1]
  ].freeze

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS 
  end

  def moves
    moves = []
    move_dirs.each do |dx, dy|
        moves.concat(grow_unblocked_moves_in_dir(dx, dy))
    end

    moves
  end

  private

  def grow_unblocked_moves_in_dir(dx, dy)
    moves = []
    move = pos

    loop do
      x, y = move
      move = [x + dx, y + dy]
      break unless board.valid_pos?(move)

      if board.empty?(move)
        moves << move
      else
        # can not take pos with the same colour piece
        break if color == board[move].color

        # can take opposite piece
        moves << move
      end
    end
    
    moves
  end
end


