def running_total arr
  arr.map.with_index {|n, i| arr[i + 1] += n unless i == arr.size - 1}
end

p running_total([2, 5, 13])
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []