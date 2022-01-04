puts 'current age?'
age = gets.to_i

puts 'desired retirement age?'
retirement = gets.to_i

years_left = retirement - age

current_year = Time.now.year
retirement_year = current_year + years_left

puts "It's now #{current_year}. You will retire in #{retirement_year}."
puts "Just #{years_left} years left..."