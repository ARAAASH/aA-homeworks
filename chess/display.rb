require "colorize"
require_relative "board"
require_relative "cursor"

class Display
  attr_reader :board, :cursor
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    8.times do |i|
      8.times do |j|
        if @cursor.cursor_pos == [i, j]
          print ' *'.colorize(:red)
        elsif @board[[i,j]] != nil
          print ' P'.colorize(:blue)
        else
          print ' _'
        end
      end
      puts
    end
  end

  
end

b = Board.new
d = Display.new(b)
d.render