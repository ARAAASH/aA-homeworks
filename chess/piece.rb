require "colorize"

class Piece
  attr_accessor :color, :position, :board
  def initialize(color, board, position)
    @color = color
    @board = board
    @position = position
  end

  def symbol
    'P'.colorize(color)
  end

  def valid_moves(end_pos)
    valid_moves = []
    @board.move_piece!(position, end_pos) unless move_into_check?(end_pos)
    
  end

  def move_into_check?(end_pos)
    new_board = board.dup
    new_board.move_piece!(position, end_pos)
    new_board.in_check?(color)
  end

  


end