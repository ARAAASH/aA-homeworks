
def first_anagrams(str1, str2)
  arr1 = str1.split('').permutation.to_a
  arr1.each do |sub_ar|
    if sub_ar.join == str2
      return true
    end
  end
  false
end

def second_anagrams(str1, str2)
  arr1 = str1.split('')
  arr2 = str2.split('')

  arr1.each_with_index do |c, i|
    if arr2.include?(c)
      idx = arr2.find_index(c)
      arr2.delete_at(idx)
    else
      return false
    end

  end
  if arr2.empty? 
    return true
  end
  
end

def third_anagrams(str1, str2)
  str1.split('').sort == str2.split('').sort
end

def fourth_anagrams(str1, str2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  str1.each_char do |c|
    hash1[c] += 1
  end

  str2.each_char do |c|
    hash2[c] += 1
  end

  return hash1 == hash2

end

def fifth_anagrams(str1, str2)
  hash = Hash.new(0)
  str1.each_char do |c|
    hash[c] += 1
  end

  str2.each_char do |c|
    hash[c] -= 1
  end

  hash.each_value.all? { |v| v==0 }

end
p fourth_anagrams("elvissqqqiole", "oilivqslees")