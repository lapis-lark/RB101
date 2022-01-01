# further
def count_occurrences(arr)
  hash = Hash.new(0)
  arr.each { |item| hash[item.downcase] += 1 }
  hash.each do |k, v|
    puts "#{k} => #{v}"
  end
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'Car', 'truck'
]

count_occurrences(vehicles)
