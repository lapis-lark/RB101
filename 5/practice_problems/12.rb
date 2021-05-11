arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
hash = {}

arr.each do |pair|
  key = pair[0]
  val = pair[1]
  hash[key] = val
end

p hash