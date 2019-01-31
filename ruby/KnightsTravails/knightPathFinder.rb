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
        move_tree = []
        until bfs_queue.empty? 
            first_node = bfs_queue.shift
            move_tree << first_node
            one_moves_away = new_move_positions(first_node)
            one_moves_away.each do |pos|
                tree_node = PolyTreeNode.new(pos)
                tree_node.parent = first_node
                bfs_queue << tree_node
            end
        end
        move_tree
    end

    def new_move_positions(node)
        pos = node.value
        valid_move = KnightPathFinder.valid_moves(pos)
        arr = valid_move.select {|ele| !@considered_positions.include?(ele)}
        @considered_positions += arr 
        return arr
    end

    def find_path(end_pos)
        end_node = @root_node.dfs(end_pos)
        trace_path_back(end_node)
    end

    def trace_path_back(end_node)
        result = []
        result << end_node
        until end_node == @root_node
            end_node = end_node.parent
            result << end_node
        end
        result.reverse 
    end
    

    
end
