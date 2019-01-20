class Board
  attr_reader :rows
  def initialize
    @rows = Array.new(8){Array.new(8)}
    
    @sentinel  
  end

  def [](pos)
    @rows[pos[0]][pos[1]]
  end

  def move_piece(start_pos, end_pos)
  end

end