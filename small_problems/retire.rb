require 'date'

puts 'age?'
age = gets.to_i
puts 'retirement age?'
retire_age = gets.to_i

current_year = Date.today.year
retire_year = current_year + (retire_age - age)
puts "It's #{current_year}, and you will retire in #{retire_year}."
