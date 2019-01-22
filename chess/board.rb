require_relative "pieces"

class Board
  attr_reader :rows, :sentinel
  def initialize
    @rows = Array.new(8){Array.new(8)}
    @sentinel = NullPiece.instance
    board_setup
  end

  def board_setup
    fill_back_row(:blue)
    fill_back_row(:red)
    fill_front_row(:blue)
    fill_front_row(:red)
    fill_empty(:white)
  end

  def fill_back_row(color)
    back_pieces = [
      Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook
    ]
    i = color == :blue ? 7 : 0
    back_pieces.each_with_index do |class_name, j|
      @rows[i][j] = class_name.new(color, self, [i, j])
    end
  end

  def fill_front_row(color)
    i = color == :blue ? 6 : 1
    8.times do |j|
      @rows[i][j] = Pawn.new(color, self, [i,j])
    end
  end

  def fill_empty(color)
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

  def empty?(pos)
    x, y = pos
    @rows[x][y] == @sentinel
  end

  def valid_pos?(pos)
    x, y = pos
    x >= 0 && x <= 7 && y >= 0 && y <= 7
  end

  # move without performing checks
  def move_piece!(start_pos, end_pos)
    piece = self[start_pos]
    raise "cannot move here" unless piece.moves.include?(end_pos)
   
    piece.position = end_pos
    self[start_pos] = @sentinel
    self[end_pos] = piece
  end

  def move_piece(start_pos, end_pos)
    piece = self[start_pos]
    raise "cannot move here" unless piece.valid_moves.include?(end_pos)
    piece.position = end_pos
    self[start_pos] = @sentinel
    self[end_pos] = piece
  end

  def possible_move_piece?(start_pos, end_pos)
    piece = self[start_pos]
    # p piece
    piece.moves.include?(end_pos)
  end

  def in_check?(color)
    king_position = king_pos(color)
    col = color == :blue ? :red : :blue 
    pieces = pieces(col)
    # p pieces[0].color
    # p "king pos: #{king_position}"
    pieces.any? do |piece|
      pos = piece.position
      # p "pos: #{pos}"
      possible_move_piece?(pos, king_position)
    end
  end

  def checkmate?(color)
    pieces = pieces(color)
    valids_bol = pieces.none? {|piece| piece.valid_moves.empty?}
    valids_bol && in_check?(color)
  end

  def pieces(color)
    pieces = []
    8.times do |i|
      8.times do |j|
        pos = [i,j]
        if self[pos].color == color
          pieces << self[pos]
        end
      end
    end 
    pieces
  end

  def king_pos(color)
    8.times do |i|
      8.times do |j|
        pos = [i,j]
        if self[pos].is_a?(King) && self[pos].color == color
          return pos
        end
      end
    end 
  end

  def dup
    new_board = Board.new
    pieces = pieces(:red) + pieces(:blue)
    pieces.each do |piece|
      piece.class.new(piece.color, new_board, piece.position)
    end
    new_board
  end

end

b = Board.new
pos = [0,3]
# p b[pos].is_a?(Knight)
# p b.valid_pos?(pos)
  k = b[pos]
# p b.possible_move_piece?(pos, [4,5])
# b.in_check?(:red)
# p k
 p k.valid_moves
# p b[pos].color
# p b.pieces(:blue).length
# b[pos] = Piece.new(:white, b, pos)
# p b[pos].color
# c = b.dup
# p c[pos].color
# b[pos] = Piece.new(:white, b, pos)
# p b[pos].color
# # p c[pos].color