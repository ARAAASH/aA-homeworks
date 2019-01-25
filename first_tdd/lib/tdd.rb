# require "byebug"

def my_uniq(array)
  hash = Hash.new(0)
  array.each { |ele| hash[ele] += 1 }
  arr = []
  hash.each do |k, v|
    arr << k
  end
  arr
end

def two_sum(array)
  res = []
  array.each_with_index do |ele, i|
    first_ele = array[i]
    # byebug
    j = i + 1
    array[j..-1].each do |ele2|
      if (first_ele + ele2) == 0
        # byebug
        res << [i, j]
      end
      j += 1
    end
  end
  res
  
end

two_sum([-1, 0, 2, -2, 1])