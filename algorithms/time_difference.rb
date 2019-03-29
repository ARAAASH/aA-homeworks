
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

# O(n^3)
def largest_contiguous_subsum(arr)
  sub = []
  0.upto(arr.length-1) do |i|
    (i).upto(arr.length-1) do |j|
      sub << arr[i..j]
    end
  end
  sums = []
  sub.each do |a|
    sums << a.reduce(:+)
  end
  sums.max
end

def largest_contiguous_subsum1(arr)
  
end

def remove_duplicates(nums)
  return 0 if nums.size < 1
  i = 0
  j = 1
  while j <= nums.size-1
    if nums[i] == nums[j]
      j += 1
    else
      
      i += 1
      nums[i], nums[j] = nums[j], nums[i]
      j += 1
    
    end
  end
  p nums  
  return i+1
end

# p largest_contiguous_subsum([-5, -1, -3])

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)
p remove_duplicates([1,1,2,2,2,2,2,3])