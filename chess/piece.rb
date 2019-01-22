# require_relative "sildingPiece"
require "colorize"

class Piece
  attr_accessor :color, :position
  def initialize(color, board, position)
    @color = color
    @board = board
    @position = position
  end

  def symbol
    'P'.colorize(color)
  end

  def move
  end


end