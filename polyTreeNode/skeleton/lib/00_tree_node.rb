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

    def to_s
        @children
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