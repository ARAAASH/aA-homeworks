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

def my_transpose(array)
  res = []
  n = array.length
  n.times do |j|
    arr = []
    n.times do |i|
      arr << array[i][j]
    end
    res << arr
  end
  res
end

def stock_picker(array)
  days = []
  array.each_with_index do |ele, i|
    if i < array.length - 1
      j = i + 1
      ele2 = array[j..-1].max
      idx = array.index(ele2)
      days << [i, idx, ele2 - ele]
    end
  end
  col_days = days.transpose
  diff = col_days[0]
  max_diff = diff.max
  idx_diff = diff.index(max_diff)
  return [days[2][0], days[2][1]]
end
