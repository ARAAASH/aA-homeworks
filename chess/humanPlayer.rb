require_relative "player"
require_relative "cursor"

class HumanPlayer < Player
  def make_move(board)
    # cursor_pos = self.color == :blue ? [6,0] : [1,0]
    # c = Cursor.new(cursor_pos, board)
    Cursor.get_input

  end  
end