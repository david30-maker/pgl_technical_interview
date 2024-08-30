def merge_remove_array(arr1, arr2)
  arr1.concat(arr2).uniq
end

arr1 = [1, 2, 3, 4, 5]
arr2 = [3, 4, 5, 6, 7]

result = merge_remove_array(arr1, arr2)
puts "Merged array: #{result}"
