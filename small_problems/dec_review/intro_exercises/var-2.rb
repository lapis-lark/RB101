puts 'how old are you?'
age = gets.to_i
x_years = 10
5.times do
  puts "in #{x_years} years you will be #{x_years + age}"
  x_years += 10
end
