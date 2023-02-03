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

list_arr = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
puts my_min(list_arr) # => -5


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

puts my_min_opt(list_arr) # => -5


def largest_contiguous_subsum(list)

  out_arr = []

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

# list = [5, 3, -7]
# p largest_contiguous_subsum(list)

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])