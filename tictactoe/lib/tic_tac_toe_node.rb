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
    us = evaluator
    if us == :x 
      opponent = :o
    else 
      opponent = :x
    end
    return true if @board.winner == opponent
    return false if @board.winner == us || @board.winner.nil?

    self.children.all? {|child| child.losing_node?(self.next_mover_mark)}
    

  end

  def winning_node?(evaluator)
  end

  def children
    children = []
    mark = :x
    if @next_mover_mark == :x 
      mark = :o
    end
    positions = [0,1,2].product([0,1,2])
    positions.each do |pos|
      children << TicTacToeNode.new(@board.dup, mark, pos) if @board.empty?(pos)  
    end
    children  
  end

end

# board = Board.new
# mark = :x
# node = TicTacToeNode.new(board, mark)
# node.children
