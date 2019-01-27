
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

p max_windowed_range([1, 0, 2, 5, 4, 8], 2)