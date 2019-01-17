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
        
        @parent = node
        if self.parent != nil 
            self.parent.children.delete(self)
        end
        node.children << self if node != nil
        
    end

    def to_s
        @children
    end
  
end

node1 = PolyTreeNode.new("1")
node2 = PolyTreeNode.new("2")
node3 = PolyTreeNode.new("3")

node2.parent = node1
node3.parent = node1
byebug
node3.parent = node2


node1.children.each do |child|
    p child.value
end