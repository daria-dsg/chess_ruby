require_relative 'player'
require_relative 'display'
require_relative 'board'

class Human_Player < Player

  def make_move(board)
    start_pos,end_pos = nil, nil

    until start_pos && end_pos
      display.render

      if start_pos == nil
        puts "Turn of #{color}. Pick the piece to move"
        start_pos = display.cursor.get_input

        display.reset!(start_pos) if start_pos

      elsif start_pos != nil
        puts "Turn of #{color}. Pick the tale where to move"
        end_pos = display.cursor.get_input 

        display.reset!(start_pos) if end_pos
      end
    end

    [start_pos,end_pos]
  end
end