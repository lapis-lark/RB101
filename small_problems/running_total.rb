=begin
def running_total arr
  arr.each.with_index {|n, i| arr[i + 1] += n unless (i + 1) == arr.size }
end
=end

def running_total(arr)
  sum = 0
  arr.map { |value| sum += value }
end

p running_total([2, 5, 13])
p running_total([14, 11, 7, 15, 20]) # == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
