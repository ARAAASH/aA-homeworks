# require_relative "board"

class Piece
  attr_reader :color, :position
  def initialize(color, position)
    @color = color
    # @board = board
    @position = position
  end


end