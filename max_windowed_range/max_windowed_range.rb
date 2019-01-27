
# O(n^2)
def max_windowed_range(array, window_size)
  windows = []
  maximums = []
  array.each_with_index do |ele, i|
    if i + window_size - 1 <= array.length - 1
      windows << array[i...i+window_size]
      maximums << array[i...i+window_size].max - array[i...i+window_size].min
    end
  end
  
  maximums.max
end

class MyQueue
  def initialize
    @store = []
  end
  
  def size
    @store.length
  end

  def empty?
    @store.size == 0
  end

  def peek
    @store[0]
  end

  def enqueue(ele)
    @store << ele
  end

  def dequeue
    @store.delete_at(0)
  end

end

class MyStack
  def initialize
    @store = []
  end
  
  def size
    @store.length
  end

  def empty?
    @store.size == 0
  end

  def peek
    @store[-1]
  end

  def push(ele)
    @store << ele
  end

  def pop
    @store.delete_at(-1)
  end
end

class StackQueue
  def initialize
    @stack = MyStack.new
    @stack_helper = MyStack.new
  end

  def size
    @stack.size + @stack_helper.size
  end

  def empty?
    @stack.empty? && @stack_helper.empty?
  end

  def enqueue(ele)
    @stack.push(ele)
  end

  def dequeue
    if !@stack.empty?
      @stack.each {|ele| @stack_helper.push(@stack.pop)}
      el = @stack_helper.pop
      @stack_helper.each {|ele| @stack.push(@stack_helper.pop)}
      el
    end
  end

end

class MinMaxStack
  def initialize
    @store = []
  end

  def size
    @store.length
  end

  def peek
    return @store[-1] unless @store.empty?
  end

  def empty?
    @store.length == 0
  end

  def push(ele)
    
    if self.empty?
      @store << [ele, 0, 0]
    else
      last = peek
      diff_min = ele - last[0] + last[2]
      if diff_min < 0 
        diff_min = 0
      end
      diff_m = last[0] + last[1] - ele
      @store << [ele, diff_m, diff_min] if diff_m >= 0
      @store << [ele, 0, diff_min] if diff_m < 0
    end
  end

  def pop
    if !self.empty?
      num = @store.delete_at(-1) unless self.empty?
      return num[0]
    end
  end

  def max
    last = self.peek
    last[0] + last[1]
  end

  def min
    last = self.peek
    last[0] - last[2]
  end
end

p max_windowed_range([1, 0, 2, 5, 4, 8], 2)