require "byebug"

class PolyTreeNode

    def initialize(new_value)
        @value = new_value
        @parent = nil
        @children = []
    end

    def parent
        @parent
    end

    def children
        @children
    end

    def value
        @value
    end

    def parent=(node)
        
        if self.parent != nil 
            self.parent.children.delete(self)
        end
        @parent = node
        node.children << self if node != nil
        
    end
    
    def add_child(child_node)
        child_node.parent=(self)
    end

    def remove_child(child_node)
        if !children.include?(child_node)
            raise "Node is not a child!"
        end
        child_node.parent=(nil) 
    end
    
    def dfs(target_value)
        return self if @value == target_value
        children.each do |child|
            searh_result = child.dfs(target_value)
            return searh_result if !searh_result.nil?
        end
        nil 
    end
    
    def bfs(target_value)
        queue = [self]

        until queue.empty?
            first = queue.shift 
            return first if first.value == target_value
            first.children.each {|child| queue.push(child)}
        end
    end

    def inspect 
        @value.inspect
    end
  
end
