def decrease(counter)
  counter[0] -= 1
end

counter = [10]

10.times do
  puts counter[0]
  decrease(counter)
end

puts 'LAUNCH!'