def my_uniq(array)
  hash = Hash.new(0)
  array.each { |ele| hash[ele] += 1 }
  arr = []
  hash.each do |k, v|
    arr << k
  end
  arr
end

def two_sum
  
end