=begin
def sum(int)
  int == 1 ? (return int) : int + sum(int - 1)
end

def product(int)
  int == 1 ? (return int) : int * product(int - 1)
end

puts 'int greater than 0 plz:'
num = gets.to_i

result = loop do
  puts "enter 's' to compute sum, 'p' to compute product"
  ans = gets.chomp.downcase
  case ans
  when 's' then break sum(num)
  when 'p' then break product(num)
  else puts "invalid input. 's' or 'p only plz"
  end
end

puts result

=end

# using inject

puts 'int greater than 0 plz:'
num = gets.to_i

result = loop do
  puts "enter 's' to compute sum, 'p' to compute product"
  ans = gets.chomp.downcase
  case ans
  when 's' then break (1..num).inject(:+)
  when 'p' then break (1..num).inject(:*)
  else puts "invalid input. 's' or 'p only plz"
  end
end

puts result
