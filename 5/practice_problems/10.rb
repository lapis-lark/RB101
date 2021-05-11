arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

new_arr = arr.map do |hash|
  hash.map { |k, v| {k => (v += 1)} }
end.flatten

p arr
p new_arr