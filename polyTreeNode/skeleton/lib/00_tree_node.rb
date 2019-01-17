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
# Write add_child(child_node) and remove_child(child_node) 
# methods. 
# These methods should be one- or two-liners that call #parent=.
    
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
    #     Write a #bfs(target_value) method to implement breadth 
    #     first search.
    # You will use a local Array variable as a queue to implement this.
    # First, insert the current node (self) into the queue.
    # Then, in a loop that runs until the array is empty:
    # Remove the first node from the queue,
    # Check its value,
    # Push the node's children to the end of the array.
    def bfs(target_value)
        queue = [self]

        until queue.empty?
            first = queue.shift 
            return first if first.value == target_value
            first.children.each {|child| queue.push(child)}
        end
    end

  
end

# node1 = PolyTreeNode.new("1")
# node2 = PolyTreeNode.new("2")
# node3 = PolyTreeNode.new("3")

# node2.parent = node1
# node3.parent = node1
# # byebug
# node3.parent = node2


# node1.children.each do |child|
#     p child.value
# end