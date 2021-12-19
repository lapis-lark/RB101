arr = []
10.times { arr << rand(100) }

arr.each_with_index do |val, index|
  puts "val: #{val} \nindex: #{index}"
  puts
end