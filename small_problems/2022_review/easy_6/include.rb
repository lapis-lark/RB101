def include?(arr, item)
  arr.each { |ele| return true if item == ele } 
  false
end

def include?(arr, item)
  arr.count(item) > 0
end



p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false