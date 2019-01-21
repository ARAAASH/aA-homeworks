require_relative "piece"

class Board
  attr_reader :rows
  def initialize
    @rows = Array.new(8){Array.new(8)}
    @sentinel = nil
    board_setup
  end

  def board_setup
    2.times do |i|
      8.times do |j|
        @rows[i][j] = Piece.new(:w, [i,j])
        @rows[i+6][j] = Piece.new(:b, [i+6,j])
      end
    end
    4.times do |i|
      8.times do |j|
        @rows[i+2][j] = nil
      end
    end
  end

  def [](pos)
    @rows[pos[0]][pos[1]]
  end

  def []=(pos, val)
    @rows[pos[0]][pos[1]] = val
  end

  def move_piece(start_pos, end_pos)
    if self[start_pos].nil?
      raise StandardError.new "There's no piece at this pos"
    end
    if !self[end_pos].nil?
      raise StandardError.new "Piece cannot move to #{end_pos}"
    end
    piece = self[start_pos]
    piece.position = end_pos
    self[start_pos] = nil
    self[end_pos] = piece

  end

end

b = Board.new
pos =[0,0]
p b[pos]
b.move_piece([5,3], [4,4])