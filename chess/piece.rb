# require_relative "board"

class Piece
  attr_accessor :color, :position
  def initialize(color, position)
    @color = color
    # @board = board
    @position = position
  end


end