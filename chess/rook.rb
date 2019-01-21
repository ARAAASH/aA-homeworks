require_relative "piece"

class Rook < Piece
  include SlidingPiece

  def symbol
    '♜'.colorize(color)
  end

  def def move_dirs
    [[-1, 0], [1, 0], [0, -1], [0, 1]]
  end
  
end