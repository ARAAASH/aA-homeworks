module SteppingPiece
  
  def move
    moves = []
  end

  def move_diffs
    # implemeted in the class
  end

  def move_steps(dx, dy)
    curr_x, curr_y = position

    loop do
      curr_x, curr_y = curr_x+dx, curr_y+dy
      position = [curr_x, curr_y]

      break until board.valid_pos?(position)

      
    end
  end

end