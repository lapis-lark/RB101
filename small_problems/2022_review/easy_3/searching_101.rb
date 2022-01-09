nums = []

(1..5).each do |i| 
  puts ">> enter number #{i}:"
  nums << gets.to_i
end

puts ">> enter the last number"
num = gets.to_i

if nums.include?(num)
  puts ">> the number #{num} appears in #{nums.to_s}"
else
  puts ">> the number #{num} does not appear in #{nums.to_s}"
end

