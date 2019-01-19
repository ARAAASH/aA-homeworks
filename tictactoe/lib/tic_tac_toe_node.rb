require_relative 'tic_tac_toe'
require "byebug"

class TicTacToeNode
  
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
    
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  def children
    children = []
    mark = :x
    if @next_mover_mark == :x 
      mark = :o
    end
    board_rows = @board.rows
    board_rows.each_with_index do |row, i|
      row.each_with_index do |ele, j|
        pos = [i, j]
        if @board.empty?(pos)
          children << TicTacToeNode.new(@board.dup, mark, pos)
        end
      end
    end
    children  
  end

end

# board = Board.new
# mark = :x
# node = TicTacToeNode.new(board, mark)
# node.children
