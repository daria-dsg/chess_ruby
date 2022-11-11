require_relative 'board.rb'
require_relative 'cursor.rb'
require 'colorize'

class Display
  attr_accessor :cursor, :board

  def initialize(board)
    @board = board
    @cursor = Cursor.new([6, 0], @board)
  end

  def build_grid
    @board.rows.map.with_index do |row, i|
       build_row(row,i)
    end
  end

  def build_row(row,i)
      row.map.with_index do |piece, j|
          color = color_to(piece,i, j)
          piece.to_s.colorize(color)
      end
  end

  def color_to(piece, i, j)
    {background: bg_color(i,j) , color: piece_color(piece)}
  end

  def bg_color(i,j)
    if @cursor.selected? && @cursor.cursor_pos == [i, j]
      bg = :light_cyan
    elsif @cursor.cursor_pos == [i, j]
      bg = :light_yellow
    elsif (i + j).even?
      bg = :default
    else
      bg = :black
    end 
  end

  def piece_color(piece)
    if piece.selected
      color = :light_green
    elsif piece.color == :white
      color = :light_magenta
    else 
      color = :light_blue
    end
  end

  def reset!(pos)
    board[pos].toggle_selected
  end

  def render
    print_default_message
    print_row
    print_chars
  end

  def print_chars
    print "  "
    ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'].each {|char| print " #{char} "}
    puts
    puts
  end

  def print_row
    build_grid.each_with_index {|row, i| puts "#{8 - i} #{row.join}"}
  end

  def print_default_message
    system("clear")
    puts "Arrow keys to move, space or enter to confirm"
    puts
  end
end