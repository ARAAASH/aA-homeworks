module SteppingPiece
  
  def move
    moves = []
    move_diffs.each do |x, y|
      moves.concat(move_steps(x,y))
    end
    moves
  end

  def move_diffs
    # implemeted in the class
  end

  def move_steps(dx, dy)
    curr_x, curr_y = position
    moves = []
    
    curr_x, curr_y = curr_x+dx, curr_y+dy
    position = [curr_x, curr_y]

    break until board.valid_pos?(position)

    if board[position] == nil
      moves << position
    else
        moves << position if board[position].color != color
    end
    moves
  end

end