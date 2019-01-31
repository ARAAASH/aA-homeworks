#O(n^2)
def my_min_v1(array)
  min = array[0]
  array.each_with_index do |ele1, i|
    min = ele1
    array.each_with_index do |ele2, j|
      next if i == j
      min = ele2 if ele2 < min
    end
  end
  min
end

#O(n)
def my_min_v2(array)
  min = array[0]
  array.each do |ele|
    min = ele if ele < min
  end  
  min
end

def largest_contiguous_sub_sum_v1(array)
  subs = []
  len = array.length 
  len.times do |i|
   
    ar = []
    ar << array[i]
    subs << ar.dup
    array[i+1..-1].each_with_index do |ele2, j|
      ar << ele2
      subs << ar.dup
      
    end
  end
  sums = []
  subs.each do |sub|
    sums << sub.sum
  end
  sums.max
end

def largest_contiguous_sub_sum_v2(array)
  largest = array.first
  curr = array.first

  return array.max if array.all? { |ele| ele < 0 }

  array.drop(1).each do |num|
    curr = 0 if curr < 0
    curr += num
    largest = curr if curr > largest
  end
  largest
end

p largest_contiguous_sub_sum_v2([2, 3, -6, 7, -6, 7])