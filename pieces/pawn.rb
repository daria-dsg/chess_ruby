require_relative 'piece'

class Pawn < Piece

  def symbol
    "♙".colorize(color)
  end

  def moves
    forward_steps
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
    cur_x, cur_y = pos

    one_step = [cur_x + forward_dir, cur_y]
    return [] unless board.valid_pos?(one_step) && board.empty?(one_step)


    steps = [one_step]
    second_step = [cur_x + 2 * forward_dir, cur_y] 
    steps << second_step if  board.valid_pos?(second_step) && board.empty?(second_step)

    steps
  end
end
