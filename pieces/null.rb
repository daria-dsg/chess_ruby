require_relative 'piece'
require 'singleton'

class Null < Piece
  include Singleton

  def initialize
    @color = :none
  end

  def symbol
    " "
  end

  def moves
    []
  end
end