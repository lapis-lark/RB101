def include?(arr, term)
  found = arr.find(-> {false}) { |e| e == term }
  found ? true : false
end

def include?(arr, term)
  arr.any? { |e| e == term }
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false