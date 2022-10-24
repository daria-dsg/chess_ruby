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
    move_dirs.each do |dir_x,dir_y|
      cur_x, cur_y = pos

      new_pos = [cur_x + dir_x, cur_y + dir_y]
      next unless @board.valid_pos?(new_pos)
          
      until blocked_moves?(new_pos)
        new_x,new_y = new_pos
        moves << new_pos 
        new_pos = [new_x + dir_x, new_y + dir_y]
      end
    end

    moves   
  end

  def blocked_moves?(pos)
    color == board[pos].color
  end
end
