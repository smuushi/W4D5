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