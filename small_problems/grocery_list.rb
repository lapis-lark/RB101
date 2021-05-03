def buy_fruit(fruits_nums)
  fruits = []
  fruits_nums.map do |fruit|
    fruit[1].times { fruits << fruit[0] }
  end
  fruits
end

def buy_fruit(fruits_nums)
  fruits_nums.map { |fruit| [fruit[0]] * fruit[1] }.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas", "bananas"]
