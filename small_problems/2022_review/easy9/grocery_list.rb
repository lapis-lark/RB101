def buy_fruit(arr)
  arr.map { |fruit, n| [fruit] * n }.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]