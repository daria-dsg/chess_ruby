require_relative 'piece'
require_relative 'slideable'

class Queen < Piece
  include Slideable

  def symbol
    "♕"
  end

  private

  def move_dirs
    diagonal_dirs + horizontal_dirs
  end
end