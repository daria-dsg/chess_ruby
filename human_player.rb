require_relative 'player'
require_relative 'display'

class Human_Player < Player

  def make_move
    start_pos,end_pos = nil, nil

    until start_pos && end_pos
      display.render

      if start_pos == nil
        puts "#{color}'s turn. Pick the piece to move"
        start_pos = display.cursor.get_input

      elsif start_pos != nil
        puts "#{color}'s turn. Pick the tale where to move"
        end_pos = display.cursor.get_input
      end
    end

    [start_pos,end_pos]
  end
end