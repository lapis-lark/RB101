def count_occurrences(arr)
  vehicles = Hash.new(0)

  arr.each { |car| vehicles[car] += 1 }

  vehicles.each { |k, v| puts "#{k} => #{v}" }
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)