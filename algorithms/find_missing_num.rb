# Assume an array of non-negative integers. A second array is 
# formed by shuffling the elements of the first array and 
# deleting a random element. Given these two arrays, find 
# which element is missing in the second array. Do this in 
# linear time with constant memory use.

# Example input/output
# > find_missing_number([8,3,5,1], [1,5,3]) // = 8

# > find_missing_number([1,1,1,1], [1,1,1]) // = 1

# > find_missing_number([3,5,4,8,7,9], [7,4,3,5,9]) // = 8

def find_missing_number(arr1, arr2)
  arr1.reduce(:+) - arr2.reduce(:+)
end


