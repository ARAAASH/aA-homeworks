
# my_min
# Given a list of integers find the smallest number in the list.

def my_min(arr)
  # +inf
  num = arr.first 
  arr.each do |el|
    num = el if el <= num
  end
  num
end

def my_min1(arr)
  min = 0
  arr.each do |el|
    arr.each do |el2|
      el <= el2 ? min = el : min = el2
      el = min
    end
  end
  min
end
# ---------------------------------------------------------------
# ---------------------------------------------------------------
# ---------------------------------------------------------------
# Largest Contiguous Sub-sum
# You have an array of integers and you want to find the largest 
# contiguous (together in sequence) sub-sum. Find the sums of all contiguous 
# sub-arrays and return the max.

# list = [2, 3, -6, 7, -6, 7]
# largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

def largest_contiguous_subsum(arr)
  
end










list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min(list)