require_relative 'game'

class Player
  def initialize(color, display)
    @color = color
    @display = display
  end

  def make_move
     @display.cursor.get_input
  end
end