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
arr = [0, 1, 5, 7]
p bad_two_sum?(arr, 16) 