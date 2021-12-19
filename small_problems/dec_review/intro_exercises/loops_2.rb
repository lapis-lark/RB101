input = ''
puts "what's your name?"
name = gets.chomp
 
until input == 'STOP'
  puts "what's your next name?"
  next_name = gets.chomp
  next_name == 'STOP' ? break : name << ' ' << next_name
end

puts "your name is #{name}"