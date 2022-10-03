def reverse_arr(arr)
  reversed = []
  (arr.size - 1).downto(0) { |i| reversed << arr[i]}
  reversed
end


list = [1,2,3,4]
p reverse_arr(list)