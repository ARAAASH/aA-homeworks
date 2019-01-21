require_relative "piece"
require_relative "NUllPiece"

class Board
  attr_reader :rows, :sentinel
  def initialize
    @rows = Array.new(8){Array.new(8)}
    @sentinel = NullPiece.instance
    board_setup
  end

  def board_setup
    2.times do |i|
      8.times do |j|
        @rows[i][j] = Piece.new(:blue, self, [i,j])
        @rows[i+6][j] = Piece.new(:red, self, [i+6,j])
      end
    end
    4.times do |i|
      8.times do |j|
        @rows[i+2][j] = @sentinel
      end
    end
  end

  def [](pos)
    @rows[pos[0]][pos[1]]
  end

  def []=(pos, val)
    @rows[pos[0]][pos[1]] = val
  end

  def valid_pos?(pos)
    x, y = pos
    x >= 0 && x <= 7 && y >= 0 && y <= 7
  end

  def empty?(pos)
    x, y = pos
    @rows[x][y] == @sentinel
  end

  def move_piece(start_pos, end_pos)
    if self.empty?(start_pos)
      raise StandardError.new "There's no piece at this pos"
    end
    if !self.empty?(end_pos)
      raise StandardError.new "Piece cannot move to #{end_pos}"
    end
    piece = self[start_pos]
    piece.position = end_pos
    self[start_pos] = @sentinel
    self[end_pos] = piece

  end

end

#  b = Board.new
#  pos =[0,0]
# p b.empty?(pos)
# p b[pos].position
# b.move_piece([0,3], [4,4])