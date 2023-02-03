require 'byebug'

# O(n^2) - due to nested each loop
def my_min(list_arr)
  min_ele = list_arr[0]
  list_arr.each do |ele|
    list_arr.each do |ele_2|
      if ele > ele_2 && min_ele > ele_2
        min_ele = ele_2
      end
    end
  end
  min_ele
end

# list_arr = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# puts my_min(list_arr) # => -5


# O(n) - due to 1 conditional call per ele
def my_min_opt(list_arr)
  min_ele = list_arr[0]
  list_arr.each do |ele|
    if ele < min_ele
      min_ele = ele
    end
  end
  min_ele
end

# puts my_min_opt(list_arr) # => -5


def largest_contiguous_subsum(list)

  sub_arrays = []
  list.each_with_index do |ele1, idx1|

    list.each_with_index do |ele2, idx2|
      sub_arrays << list[idx1..idx2] if idx1 <= idx2
    end

  end
  
  max_sum = sub_arrays.first.sum

  sub_arrays.each do |sub_arr|
    max_sum = sub_arr.sum if sub_arr.sum > max_sum

  end

  return max_sum

end
# O(n^2) + n => evaluates to n^2 becuase it will dominate the method in a large input

# list = [5, 3, -7]
# p largest_contiguous_subsum(list)

# list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

def better_largest_contiguous_subsum(list)
  
  current_sum = list.first
  largest_sum = list.first

  # count = 0

  # (1...list.length).each do |idx|
  #   # current_sum = list[idx]
  #   if current_sum + list[idx] > current_sum
  #     current_sum = current_sum + list[idx]
  #   else
  #     largest_sum = current_sum
  #     current_sum = list[idx + 1]
  #   end
  # end

  list.each_with_index do |ele, idx|
    # debugger
    
    if idx == 0
      current_sum = ele
      next
    end

    if (current_sum + ele) > current_sum
      current_sum = current_sum + ele
    else
      largest_sum = current_sum if largest_sum < current_sum
      current_sum = ele
      if current_sum < 0
        current_sum = ele
      end
    end

  end
  
  # j = i
  # while i < list.length
  #   current_sum = list[i..j].sum
  #   if current_sum > max_sum
  #     max_sum = current_sum
  #   end
  #   if j < list.length
  #     j += 1
  #   else
  #     i += 1
  #   end
  #   count += 1
  # end

  return largest_sum

end
# list = [2, 2]

list = [2, 3, -6, 7, -6, 7]
p better_largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])