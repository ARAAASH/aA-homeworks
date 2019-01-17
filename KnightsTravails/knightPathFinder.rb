require_relative "tree_node"
require "byebug"

class KnightPathFinder

    def self.valid_moves(pos)
        x, y = pos
        
        i = [-2, -2, -1, -1, 1, 1, 2, 2]
        j = [-1, 1, -2, 2, -2, 2, -1, 1]
        valid_pos = []
        8.times do |k|
            if x+i[k] >= 0 && x+i[k] <= 7 && y+j[k] >=0 && y+j[k] <=7
                valid_pos << [x+i[k], y+j[k]]
            end
        end
        valid_pos
    end

    def initialize(starting_position)
        @root_node = PolyTreeNode.new(starting_position)
        @considered_positions = [starting_position]
        build_move_tree


    end

    def build_move_tree
        
        start_pos = @root_node
        bfs_queue = [start_pos]
        
        until bfs_queue.empty? 
            first_node = bfs_queue.shift
            p first_node
            # byebug
            one_moves_away = new_move_positions(first_node)
            one_moves_away.each do |pos|
                bfs_queue << PolyTreeNode.new(pos)
            end
        end
            
    end

    def new_move_positions(node)
        pos = node.value
        valid_move = KnightPathFinder.valid_moves(pos)
        arr = valid_move.select {|ele| !@considered_positions.include?(ele)}
        return @considered_positions += arr 
    end

    

    
end

k = KnightPathFinder.new([4,4])
