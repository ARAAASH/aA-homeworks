
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
      @stack_helper.push(@stack.pop) until @stack.empty?
      el = @stack_helper.pop
      @stack.push(@stack_helper.pop) until @stack_helper.empty?
      
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

class MinMaxStackQueue
  def initialize
    @stack_in = MinMaxStack.new
    @stack_out = MinMaxStack.new
  end

  def size
    @stack_in.size + @stack_out.size
  end

  def empty?
    @stack_in.size == 0 && @stack_out.size == 0
  end

  def enqueue(ele)
    @stack_in.push(ele)
  end

  def dequeue
    if !@stack_in.empty?
      @stack_out.push(@stack_in.pop) until @stack_in.empty?
      
      @stack_out.pop
      @stack_in.push(@stack_out.pop) until @stack_out.empty?
      
    end
  end

  def max
    @stack_in.max
  end

  def min
    @stack_in.min
  end


end

def windowed_max_range1(array, w)
  current_max_range = nil
  window = MinMaxStackQueue.new
  res = nil
  array.each_with_index do |ele, i|
    window.enqueue(ele)  
    window.dequeue if window.size > w
    if window.size == w
      current_max_range = window.max - window.min
      res = current_max_range if !res || current_max_range > res
    end
  end
  res
end

if __FILE__ == $PROGRAM_NAME
  p windowed_max_range1([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
  p windowed_max_range1([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
  p windowed_max_range1([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
  p windowed_max_range1([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
end
