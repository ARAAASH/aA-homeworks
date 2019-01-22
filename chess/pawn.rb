require_relative "piece"
require "colorize"

class Pawn < Piece

  def symbol
    '♟'.colorize(color)
  end

  def moves
    moves = []
    dx, dy = move_dirs
  end

  def move_dirs
    self.color == :blue ? [[-1,0], [-2,0]] : [[1,0], [2,0]]
  end

  def side_attacks
    self.color == :blue ? [[-1,1], [-1,-1]] : [[1,-1], [1,1]]
  end

  def move_forward_not_blocked(dx, dy)
    moves = []
    x, y = self.position
    x, y = x+dx, y+dy
    new_position = [x, y]
    if dx.abs != 2
      if @board.empty?(new_position) && @board.valid_position?(new_position)
        moves << new_position
        position = new_position
      end
    else
      if @board.empty?(new_position) && (self.position[0] == 1 || self.position[0] == 6)
        moves << new_position
        position = new_position
      end
    end
    moves
  end

  def attack_moves(dx, dy)
    moves = []
    x, y = self.position
    x, y = x+dx, y+dy
    position = [x, y]
    if @board[position].color != self.color && @board.valid_position?(position)
      moves << position
    end
    moves
  end

  
end