require_relative "piece"
require "colorize"

class Pawn < Piece

  def symbol
    '♟'.colorize(color)
  end

  def moves
    
  end
  
end