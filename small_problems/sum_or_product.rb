puts 'int greater than 0 plz: '
num = gets.to_i
puts "enter 's' to get sum or 'p' to get product"
operation = gets.chomp
if operation == 's'
  puts (1..num).to_a.inject(:+)
elsif operation == 'p'
  puts (1..num).to_a.inject(:*)
else
  puts 'unknown operation'
end