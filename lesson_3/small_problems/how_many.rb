vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]
=begin
def count_occurrences(array)
  occurrences = Hash.new(0)
  array.each do |word|
    if occurrences.keys.include?(word)
      occurrences[word] += 1
    else
      occurrences[word] = 1
    end
  end
  occurrences.each do |k, v|
    puts "#{k} => #{v}"
  end
end
=end

def count_occurrences(array)
  occurrences = {}
  array.uniq.each do |element|
    occurrences[element] = array.count(element)
  end

  occurrences.each do |k, v|
    puts "#{k} => #{v}"
  end
end

count_occurrences(vehicles)

