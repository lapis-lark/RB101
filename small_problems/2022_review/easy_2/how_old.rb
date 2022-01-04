puts "Which person's age would you like to know?"
name = gets.chomp
name = 'Teddy' if name == ''
puts "#{name} is #{rand(20..200)} years old!"