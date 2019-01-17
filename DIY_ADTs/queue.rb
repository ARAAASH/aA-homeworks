class Queue

    def initialize
        @queue = []
    end

    def enqueque(ele)
        @queue << ele
    end

    def dequeque
        @queue.shift
    end

    def peek
        @queue[-1]
    end
    
end