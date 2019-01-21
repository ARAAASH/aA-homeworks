require_relative "piece"
require_relative "slidingPiece"

class Bishop < Piece
  include "slidingPiece"

  def symbol
    '♝'.colorize(color)
  end
  
  def move_dirs
    [[-1, -1],[1, -1],[-1, 1], [1, 1]]
  end
end