require_relative "tree_node"

class KnightPathFinder

    def self.valid_moves(pos)
        x, y = pos
        i = [-2, -2, -1, -1, 1, 1, 2, 2]
        j = [-1, 1, -2, 2, -2, 2, -1, 1]
        valid_pos = []
        i.times do |k|
            if x+i[k] >= 0 && x+i[k] <= 7 && y+j[k] >=0 && y+j[k] <=7
                valid_pos << [x+i[k], y+j[k]]
            end
        end
        valid_pos
    end

    def initialize(starting_position)
        @root_node = PolyTreeNode.new(starting_position)
        build_move_tree

    end

    def build_move_tree
        
    end

    def find_path
        
    end

    def new_move_positions
        
    end

    
end