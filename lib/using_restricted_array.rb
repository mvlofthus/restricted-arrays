require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
# Time complexity: O(n)
# Space complexity: O(1)
def length(array)
  n = 0

  until array[n] == nil
    n += 1
  end

  return n
  #raise NotImplementedError
end

# Prints each integer values in the array
# Time complexity: O(n)
# Space complexity: O(1)
def print_array(array)
  printed_elements = ""
  n = 0

  until array[n] == nil
    printed_elements += "#{array[n]} "
    n += 1
  end
  #raise NotImplementedError
  return printed_elements
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity:  O(n)
# Space complexity: O(1)
def search(array, length, value_to_find)
  n = 0
  value_search = false

  until n == length
    if array[n] == value_to_find
      value_search = true
    end
    n += 1
  end

  return value_search

  #raise NotImplementedError
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
# Time complexity: O(n)
# Space complexity: O(1)
def find_largest(array, length)
  largest_value = 0
  n = 0

  until n == length
    if array[n] == nil
      return false
    elsif array[n] > largest_value
      largest_value = array[n]
    end
    n += 1
  end

  return largest_value
  #raise NotImplementedError
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
# Time complexity: O(n)
# Space complexity: O(1)
def find_smallest(array, length)
  smallest_value = 221
  n = 0

  until n == length
    if array[n] == nil
      return false
    elsif array[n] < smallest_value
      smallest_value = array[n]
    end

    n+=1

  end

  return smallest_value

  #raise NotImplementedError
end

# Reverses the values in the integer array in place
# Time complexity: O(n)
# Space complexity: O(1)
def reverse(array, length)
  i = 0
  j = (length - 1)

  if length <= 1
    return array
  end

  while i < j
    temp = array[i]
    array[i] = array[j]
    array[j] = temp

    i += 1
    j -= 1
  end

  return array
  # raise NotImplementedError
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(log(n))
# Space complexity: O(n)
def binary_search(array, length, value_to_find)
  low = 0
  high = length - 1

  if length == 0
    return false
  end

  while low <= high
    mid = (low + high) / 2
    if array[mid] == value_to_find
      return true
    elsif array[mid] > value_to_find
      high = mid - 1
    else
      low = mid + 1
    end
  end

  if array[mid] != value_to_find
   return false
  end
  #raise NotImplementedError
end

# Helper method provided to sort the array in ascending order
# Implements selection sort
# Time complexity = O(n^2), where n is the number of elements in the array.
# To find the correct value for index 0, a total of (n-1) comparisons are needed.
# To find the correct value for index 1, a total of (n-2) comparisons are needed.
# To find the correct value for index 2, a total of (n-3) comparisons are needed.
# and so on ...
# To find the correct value for index (n-2), a total of 1 comparisons is needed.
# To find the correct value for the last index, a total of 0 comparisons are needed.
# Total number of comparisons = (n-1) + (n-2) + ... 3 + 2 + 1
#                             = (n * (n-1))/2
# This is O(n^2) in Big O terms.
# Space complexity = constant or O(1) since the additional storage needed,
# does not depend on input array size.
def sort(array, length)
  length.times do |index| # outer loop - n elements
    min_index = index # assume index is where the next minimally value is
    temp_index = index+1 # compare with values at index+1 to length-1
    while temp_index < length # inner loop - n-1 elements
      if array[temp_index] < array[min_index] # found a new minimum, update min_index
        min_index = temp_index
      end
      temp_index += 1 # move to next index
    end
    if min_index != index # next minimum value is not at current index, swap
      temp = array[min_index]
      array[min_index] = array[index]
      array[index] = temp
    end
  end
end
## --- END OF METHODS ---
