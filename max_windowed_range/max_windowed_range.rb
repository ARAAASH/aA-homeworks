
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

p max_windowed_range([1, 0, 2, 5, 4, 8], 2)