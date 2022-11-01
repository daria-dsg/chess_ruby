require_relative 'board.rb'
require_relative 'cursor.rb'
require 'colorize'

class Display
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], @board)
  end

  def build_grid
    @board.rows.map.with_index do |row, i|
       build_row(row,i)
    end
  end

  def build_row(row,i)
      row.map.with_index do |piece, j|
          color = color_to(i, j)
          piece.to_s.colorize(color)
      end
  end

  def color_to(i, j) 
    if @cursor.selected? && @cursor.cursor_pos == [i, j]
      bg = :light_cyan
    elsif @cursor.cursor_pos == [i, j]
      bg = :light_yellow
    elsif (i + j).even?
      bg = :default
    else
      bg = :black
    end 
    {background: bg}
  end

  def render
    build_grid.each_with_index {|row, i| puts "#{8 - i} #{row.join}"}
    print "  "
    ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'].each {|char| print " #{char} "}
  end

  def test
    loop do
      system("clear")
      render
      @cursor.get_input
    end
  end
end