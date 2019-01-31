
# O(n^2)
def bad_two_sum?(arr, target)

  arr.each_with_index do |ele, i|
    arr[i+1..-1].each_with_index do |ele2, j|
      if ele + ele2 == target
        return true
      end
    end
  end
  false
end

# O(n log n)
def okay_two_sum?(arr, target)
  arr_sorted = arr.sort
  l = 0
  r = arr_sorted.length - 1
  while l < r
    if arr_sorted[l] + arr_sorted[r] == target
      return true
    elsif arr_sorted[l] + arr_sorted[r] < target
      l += 1
    else
      r -= 1
    end
  end
  false
end

def two_sum?(arr, target)
  hash = Hash.new(0)

  arr.each do |ele|
    if hash.include?(target - ele)
      return true
    else
      hash[ele] += 1
    end
  end
  false

end



arr = [0, 1, 5, 7]
p two_sum?(arr, 8) 